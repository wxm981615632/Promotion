<?php

//登录日志写入数据库

namespace listen;

class LoginLog
{
	
    public function handle($event){
        $data['application_name'] = app('http')->getName();
		$data['username'] = session(app('http')->getName().'.username');
		$data['url'] = request()->url(true);
		$data['ip'] = request()->ip();
		$data['useragent'] = request()->server('HTTP_USER_AGENT');
		$data['create_time'] = time();
		$data['type'] = 1;
		
		db('log')->insertGetId($data);
    }
}