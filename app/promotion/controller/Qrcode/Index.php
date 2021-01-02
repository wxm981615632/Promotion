<?php 
/*
 module:		二维码管理
 create_time:	2020-12-31 16:48:17
 author:		
 contact:		
*/

namespace app\promotion\controller\Qrcode;

use app\promotion\service\Qrcode\IndexService;
use app\promotion\model\Qrcode\Index as IndexModel;
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
			$where['user_id'] = $this->request->param('user_id', '', 'serach_in');
			$where['soft_id'] = $this->request->param('soft_id', '', 'serach_in');
			$where['status'] = $this->request->param('status', '', 'serach_in');

			$create_time_start = $this->request->param('create_time_start', '', 'serach_in');
			$create_time_end = $this->request->param('create_time_end', '', 'serach_in');

			$where['create_time'] = ['between',[strtotime($create_time_start),strtotime($create_time_end)]];

			$order  = $this->request->post('order', '', 'serach_in');	//排序字段 bootstrap-table 传入
			$sort  = $this->request->post('sort', '', 'serach_in');		//排序方式 desc 或 asc

			$field = '';
			$orderby = ($sort && $order) ? $sort.' '.$order : 'id desc';

			$sql = 'select a.id,b.realname user,c.name soft,a.status,a.create_time from cd_promotion_qrcode a,cd_promotion_user b,cd_promotion_soft c where a.user_id=b.id and a.soft_id=c.id';
			$limit = ($page-1) * $limit.','.$limit;
			$res = \xhadmin\CommonService::loadList($sql,formatWhere($where),$limit,$orderby);
			return json($res);
		}
	}

	/*修改排序开关按钮操作*/
	function updateExt(){
		$postField = 'id,status';
		$data = $this->request->only(explode(',',$postField),'post',null);
		if(!$data['id']) $this->error('参数错误');
		try{
			IndexModel::update($data);
		}catch(\Exception $e){
			abort(config('my.error_log_code'),$e->getMessage());
		}
		return json(['status'=>'00','msg'=>'操作成功']);
	}

	/*添加*/
	function add(){
		if (!$this->request->isPost()){
			return view('add');
		}else{
			$postField = 'user_id,soft_id,status,create_time';
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
			$postField = 'id,user_id,soft_id,status,create_time';
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

	/*导出*/
	function dumpData(){
		$where = [];
		$where['user_id'] = $this->request->param('user_id', '', 'serach_in');
		$where['soft_id'] = $this->request->param('soft_id', '', 'serach_in');
		$where['status'] = $this->request->param('status', '', 'serach_in');

		$create_time_start = $this->request->param('create_time_start', '', 'serach_in');
		$create_time_end = $this->request->param('create_time_end', '', 'serach_in');

		$where['create_time'] = ['between',[strtotime($create_time_start),strtotime($create_time_end)]];
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



}

