<?php

namespace app\promotion\controller;
use app\BaseController;

class Admin extends BaseController
{
	
	public function initialize(){
		$controller = $this->request->controller();
		$action = $this->request->action();
		$app = app('http')->getName();
		
		$promotion = session('promotion');
		$userid = session('promotion_sign') == data_auth_sign($promotion) ? true : false;
		
		if( !$userid && ( $app <> 'promotion' || $controller <> 'Login' )){
			echo '<script type="text/javascript">top.parent.frames.location.href="'.url('promotion/Login/index').'";</script>';exit();
		}
		
		foreach(config('my.nocheck') as $val){
			$nocheck[] = str_replace('admin','promotion',$val);
		}
		$url =  "{$app}/{$controller}/{$action}";
		if(session('promotion.role_id') <> 1 && !in_array($url,$nocheck) && $action !== 'startImport'){	
			if(!in_array($url,session('promotion.nodes'))){
				throw new ValidateException ('你没操作权限');
			}	
		}
		
		event('DoLog');
		
		$list = db("config")->cache(true,60)->select()->column('data','name');
		config($list,'xhadmin');
	}
	

}
