<?php

namespace app\promotion\controller;
use app\promotion\controller\Admin;
use think\facade\Validate;
use think\facade\Filesystem;
use think\exception\ValidateException;
use think\Image;
use think\facade\Log;

class Upload extends Admin{
	
	
	//上传文件检测hash唯一 不存在文件则上传 并且记录文件信息 存在文件信息 则先检测文件物理路径存在否 不存在也上传 否则返回文件路径
	private function upload($filekey){
		$file = $this->request->file($filekey);
		$upload_config_id = $this->request->get('upload_config_id','','intval'); //上传配置id
		
		$file_type = upload_replace(config('xhadmin.file_type')); //上传黑名单过滤
		if(!Validate::fileExt($file,$file_type) || !Validate::fileSize($file,config('xhadmin.file_size') * 1024 * 1024)){
			throw new ValidateException('上传验证失败');
		}
		//检测图片路径已存在  true 检测 读取已有的图片路径 false不检测 每次都重新上传新的
		$upload_hash_status = !is_null(config('my.upload_hash_status')) ? config('my.upload_hash_status') : true;
		$fileinfo = $upload_hash_status ? db("file")->where('hash',$file->hash('md5'))->find() : false;
		if($upload_hash_status && $fileinfo && $this->checkFileExists($fileinfo['filepath'])){
			$url =  $fileinfo['filepath'];
		}else{
			$url = $this->up($file,$upload_config_id);
		}
		return $url;
	}
	
	protected function up($file,$upload_config_id){
		try{
			if(config('my.oss_status')){
				$url = \utils\oss\OssService::OssUpload(['tmp_name'=>$file->getPathname(),'extension'=>$file->extension()]);
			}else{
				$info = Filesystem::disk('public')->putFile(\utils\oss\OssService::setFilepath(),$file,'uniqid');
				$url = \utils\oss\OssService::getAdminFileName(basename($info));
				if($upload_config_id && !config('my.oss_status') && in_array(pathinfo($info)['extension'],['jpg','png','gif','jpeg','bmp'])){
					$this->thumb(config('my.upload_dir').'/'.$info,$upload_config_id); //生成缩略图或者水印
				}
			}
		}catch(\Exception $e){
			abort(config('my.error_log_code'),$e->getMessage());
		}
		
		$upload_hash_status = !is_null(config('my.upload_hash_status')) ? config('my.upload_hash_status') : true; 
		$upload_hash_status && db('file')->insert(['filepath'=>$url,'hash'=>$file->hash('md5'),'create_time'=>time()]);
		
		return $url;
	}
	
	//普通图片上传
	public function uploadImages()
	{
		$url = $this->upload('file');
		if($url){
			return json(['code'=>1,'data'=>$url]);
		}else{
			return json(['code'=>0,'msg'=>'上传失败']);
		}
	}
	
	
	//xheditor编辑器上传
	public function editorUpload() {
		$url = $this->upload('filedata');
		if($url){
			echo '{err: "", msg: {url: "!'.$url.'", localname: "", id: "1"}}';
		}
	}
	
	
	//百度编辑器上传
	public function uploadUeditor(){
		$ueditor_config = json_decode(preg_replace("/\/\*[\s\S]+?\*\//", "", file_get_contents("static/js/ueditor/php/config.json")), true);
        $action = $_GET['action'];
        switch ($action) {
            case 'config':
                $result = json_encode($ueditor_config);
                break;
            /* 上传图片 */
            case 'uploadimage':
                /* 上传涂鸦 */
            case 'uploadscrawl':
                /* 上传视频 */
            case 'uploadvideo':
                /* 上传文件 */
            case 'uploadfile':
				$url = $this->upload('upfile');
				$result = json_encode(array(
					'url' => $url,
					'title' => htmlspecialchars($_POST['pictitle'], ENT_QUOTES),
					'original' => basename($url),
					'state' => 'SUCCESS'
				));
                break;
            default:
                $result = json_encode(array(
                    'state' => '请求地址出错'
                ));
                break;
        }
        /* 输出结果 */
        if (isset($_GET["callback"])) {
            if (preg_match("/^[\w_]+$/", $_GET["callback"])) {
                echo htmlspecialchars($_GET["callback"]) . '(' . $result . ')';
            } else {
                echo json_encode(array(
                    'state' => 'callback参数不合法'
                ));
            }
        } else {
            echo $result;
        }
	}
	
	//markdown编辑器上传
	public function markDownUpload() {
		$url = $this->upload('editormd-image-file');
		if($url){
			return json(['url'=>$url,'success'=>1,'message'=>'图片上传成功!']);
		}
	}
	
	//生成缩略图或水印
	private function thumb($imagesUrl,$upload_config_id){
		$configInfo = db("upload_config")->where('id',$upload_config_id)->find();
		if($configInfo){ 
			$image = Image::open($imagesUrl);
			$targetimages = $imagesUrl;
			
			//当设置不覆盖生成新的文件名
			if(!$configInfo['upload_replace']){
				$fileinfo = pathinfo($imagesUrl);
				$targetimages = $fileinfo['dirname'].'/s_'.$fileinfo['basename'];
				copy($imagesUrl,$targetimages);
			}
			
			//生成缩略图
			if($configInfo['thumb_status']){
				$image->thumb($configInfo['thumb_width'], $configInfo['thumb_height'],$configInfo['thumb_type'])->save($targetimages);
			}
			
			//生成水印
			if(file_exists('.'.config('xhadmin.water_logo')) && config('xhadmin.water_status') && config('xhadmin.water_position')){
				$image->water('.'.config('xhadmin.water_logo'),config('xhadmin.water_position'))->save($targetimages); 
			}	
		}
	}
	
	//检测文件是否存在
	public function checkFileExists($filepath){
		if(strpos($filepath, '://')){
			$res = file_get_contents($filepath) ? true: false;
		}else{
			$res = file_exists('.'.$filepath) ? true: false;
		}
		return $res;
	}
	
    
}