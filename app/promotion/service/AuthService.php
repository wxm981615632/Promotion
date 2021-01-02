<?php

namespace app\promotion\service;
use \think\facade\Db; 

class AuthService
{

    /**
     * 根据用户名密码，验证用户是否能成功登陆
     * 
     * @param string $user
     * @param string $pwd
     * @throws \Exception
     * @return mixed
     */
    public static function checkLogin($user, $pwd) {
		
		$where['tempUsername'] = $user;
		$pwd = !empty(config('my.password_secrect')) ? $pwd.config('my.password_secrect') : $pwd;
		$where['tempPassword']  = md5($pwd);
		$info = Db::name('tablename')->where($where)->find();
		if(!$info){
			throw new \Exception("请检查用户名或者密码");
		}
		
		if(!$info['role']){
			$info['role'] = 1;	
		}
		
		if(!$info['username']){
			$info['username'] = $info['tempUsername'];
		}
		
		session('promotion', $info);
		session('promotion_sign', data_auth_sign($info));
		
		event('AdminLogin',$info);	//写入登录日志
		
        return true;
    }
    
    
}
