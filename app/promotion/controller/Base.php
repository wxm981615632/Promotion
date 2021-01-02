<?php

namespace app\promotion\controller;

class Base extends Admin
{
   
    /*修改密码*/
    public function password(){
	    if (!$this->request->isPost()){	
			return view('password');
		}else{			
			$password = $this->request->post('password', '', 'strip_tags,trim');
			$data['password'] = md5($password.config('my.password_secrect'));
			$data['id'] = session('promotion.id');
			try {
				db('promotion_admin')->update($data);
			} catch (\Exception $e) {
				abort(config('my.error_log_code'),$e->getMessage());
			}
            return json(['status'=>'00','message'=>'修改成功']);
		}
    }
  
	

}
