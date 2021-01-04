<?php 
/*
 module:		域名池
 create_time:	2021-01-04 10:21:14
 author:		
 contact:		
*/

namespace app\promotion\controller;

use app\promotion\service\DomainService;
use app\promotion\model\Domain as DomainModel;
use think\facade\Db;

class Domain extends Admin {


	/*首页数据列表*/
	function index(){
		if (!$this->request->isAjax()){
			return view('index');
		}else{
			$limit  = $this->request->post('limit', 20, 'intval');
			$offset = $this->request->post('offset', 0, 'intval');
			$page   = floor($offset / $limit) +1 ;

			$where = [];
			$where['title'] = $this->request->param('title', '', 'serach_in');
			$where['domain'] = $this->request->param('domain', '', 'serach_in');
			$where['is_main'] = $this->request->param('is_main', '', 'serach_in');
			$where['ip'] = $this->request->param('ip', '', 'serach_in');

			$order  = $this->request->post('order', '', 'serach_in');	//排序字段 bootstrap-table 传入
			$sort  = $this->request->post('sort', '', 'serach_in');		//排序方式 desc 或 asc

			$field = 'id,title,domain,is_main,ip';
			$orderby = ($sort && $order) ? $sort.' '.$order : 'id desc';

			$res = DomainService::indexList(formatWhere($where),$field,$orderby,$limit,$page);
			return json($res);
		}
	}

	/*修改排序开关按钮操作*/
	function updateExt(){
		$postField = 'id,is_main';
		$data = $this->request->only(explode(',',$postField),'post',null);
		if(!$data['id']) $this->error('参数错误');
		try{
			DomainModel::update($data);
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
			$postField = 'title,domain,is_main,ip';
			$data = $this->request->only(explode(',',$postField),'post',null);
			$res = DomainService::add($data);
			return json(['status'=>'00','msg'=>'添加成功']);
		}
	}

	/*修改*/
	function update(){
		if (!$this->request->isPost()){
			$id = $this->request->get('id','','serach_in');
			if(!$id) $this->error('参数错误');
			$this->view->assign('info',checkData(DomainModel::find($id)));
			return view('update');
		}else{
			$postField = 'id,title,domain,is_main,ip';
			$data = $this->request->only(explode(',',$postField),'post',null);
			$res = DomainService::update($data);
			return json(['status'=>'00','msg'=>'修改成功']);
		}
	}

	/*删除*/
	function delete(){
		$idx =  $this->request->post('id', '', 'serach_in');
		if(!$idx) $this->error('参数错误');
		try{
			DomainModel::destroy(['id'=>explode(',',$idx)],true);
		}catch(\Exception $e){
			abort(config('my.error_log_code'),$e->getMessage());
		}
		return json(['status'=>'00','msg'=>'操作成功']);
	}



}

