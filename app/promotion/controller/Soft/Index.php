<?php 
/*
 module:		应用管理
 create_time:	2020-12-31 16:35:08
 author:		
 contact:		
*/

namespace app\promotion\controller\Soft;

use app\promotion\service\Soft\IndexService;
use app\promotion\model\Soft\Index as IndexModel;
use app\promotion\controller\Admin;
use think\facade\Db;

class Index extends Admin {


	/*首页数据列表*/
	function index(){
		if (!$this->request->isAjax()){
			return view('index');
		}else{
			$limit  = $this->request->post('limit', 20, 'intval');
			$offset = $this->request->post('offset', 0, 'intval');
			$page   = floor($offset / $limit) +1 ;

			$where = [];
			$where['name'] = ['like',$this->request->param('name_s', '', 'serach_in')];

			$order  = $this->request->post('order', '', 'serach_in');	//排序字段 bootstrap-table 传入
			$sort  = $this->request->post('sort', '', 'serach_in');		//排序方式 desc 或 asc

			$field = 'id,name,version,file_url,background';
			$orderby = ($sort && $order) ? $sort.' '.$order : 'id desc';

			$res = IndexService::indexList(formatWhere($where),$field,$orderby,$limit,$page);
			return json($res);
		}
	}

	/*添加*/
	function add(){
		if (!$this->request->isPost()){
			return view('add');
		}else{
			$postField = 'name,version,file_url,background';
			$data = $this->request->only(explode(',',$postField),'post',null);
			$res = IndexService::add($data);
			return json(['status'=>'00','msg'=>'添加成功']);
		}
	}

	/*修改*/
	function update(){
		if (!$this->request->isPost()){
			$id = $this->request->get('id','','serach_in');
			if(!$id) $this->error('参数错误');
			$this->view->assign('info',checkData(IndexModel::find($id)));
			return view('update');
		}else{
			$postField = 'id,name,version,file_url,background';
			$data = $this->request->only(explode(',',$postField),'post',null);
			$res = IndexService::update($data);
			return json(['status'=>'00','msg'=>'修改成功']);
		}
	}

	/*删除*/
	function delete(){
		$idx =  $this->request->post('id', '', 'serach_in');
		if(!$idx) $this->error('参数错误');
		try{
			IndexModel::destroy(['id'=>explode(',',$idx)],true);
		}catch(\Exception $e){
			abort(config('my.error_log_code'),$e->getMessage());
		}
		return json(['status'=>'00','msg'=>'操作成功']);
	}

	/*查看详情*/
	function view(){
		$id = $this->request->get('id','','serach_in');
		if(!$id) $this->error('参数错误');
		$this->view->assign('info',IndexModel::find($id));
		return view('view');
	}

	/*导出*/
	function dumpData(){
		$where = [];
		$where['name'] = ['like',$this->request->param('name', '', 'serach_in')];
		$where['id'] = ['in',$this->request->param('id', '', 'serach_in')];

		try {
			//此处读取前端传过来的 表格勾选的显示字段
			$fieldInfo = [];
			for($j=0; $j<100;$j++){
				$fieldInfo[] = $this->request->param($j);
			}
			$list = IndexModel::where(formatWhere($where))->order('id desc')->select();
			if(empty($list)) throw new Exception('没有数据');
			IndexService::dumpData(htmlOutList($list),filterEmptyArray(array_unique($fieldInfo)));
		} catch (\Exception $e) {
			$this->error($e->getMessage());
		}
	}

	/*导入*/
	function import(){
		if ($this->request->isPost()) {
			try{
				$key = 'Index';
				$result = \xhadmin\CommonService::importData($key);
				if (count($result) > 0) {
					cache($key,$result,3600);
					return redirect('startImport');
				} else{
					$this->error('内容格式有误！');
				}
			}catch(\Exception $e){
				$this->error($e->getMessage());
			}
		}else {
			return view('base/importData');
		}
	}

	//开始导入
	function startImport(){
		if(!$this->request->isPost()) {
			return view('base/startImport');
		}else{
			$p = $this->request->post('p', '', 'intval'); 
			$data = cache('Index');
			$export_per_num = config('my.export_per_num') ? config('my.export_per_num') : 50;
			$num = ceil((count($data)-1)/$export_per_num);
			if($data){
				$start = $p == 1 ? 2 : ($p-1) * $export_per_num + 1;
				if($data[$start]){
					$dt['percent'] = ceil(($p)/$num*100);
					try{
						for($i=1; $i<=$export_per_num; $i++ ){
						//根据中文名称来读取字段名称
							if($data[$i + ($p-1)*$export_per_num]){
								foreach($data[1] as $key=>$val){
									$fieldInfo = db('field')->where(['name'=>$val,'menu_id'=>725])->find();
									if($val && $fieldInfo){
										$d[$fieldInfo['field']] = $data[$i + ($p-1)*$export_per_num][$key];
										if($fieldInfo['type'] == 17){
											unset($d[$fieldInfo['field']]);
										}
										if(in_array($fieldInfo['type'],[7,12])){	//时间字段
											if(strlen($data[$i + ($p-1)*$export_per_num][$key]) == 5){
												$d[$fieldInfo['field']] = \PhpOffice\PhpSpreadsheet\Shared\Date::excelToTimestamp($data[$i + ($p-1)*$export_per_num][$key]);
											}else{
												$d[$fieldInfo['field']] = strtotime($data[$i + ($p-1)*$export_per_num][$key]);
											}
										}
										if($fieldInfo['type'] == 5){	//密码字段
											$d[$fieldInfo['field']] = md5($data[$i + ($p-1)*$export_per_num][$key].config('my.password_secrect'));
										}
										if($fieldInfo['type'] == 17){	//三级联动字段
											$arrTitle = explode('|',$fieldInfo['field']);
											$arrValue = explode('-',$data[$i + ($p-1)*$export_per_num][$key]);
											if($arrTitle && $arrValue){
												foreach($arrTitle as $k=>$v){
													$d[$v] = $arrValue[$k];
												}
											}
										}
										if(in_array($fieldInfo['type'],[2,3,23,29]) && empty($fieldInfo['sql'])){	//下拉，单选，开关按钮
											$d[$fieldInfo['field']] = getFieldName($data[$i + ($p-1)*$export_per_num][$key],$fieldInfo['config']);
										}
									}
								}
								if(($i + ($p-1)*$export_per_num) > 1){
									Soft/IndexModel::create($d);
								}
							}
						}
					}catch(\Exception $e){
						abort(config('my.error_log_code'),$e->getMessage());
					}
					return json(['error'=>'00','data'=>$dt]);
				}else{
					cache('Index',null);
					return json(['error'=>'10']);
				}
			}else{
				$this->error('当前没有数据');
			}
		}
	}


}

