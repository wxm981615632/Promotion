<?php 
/*
 module:		人员管理验证器
 create_time:	2020-12-31 15:20:07
 author:		
 contact:		
*/

namespace app\promotion\validate;
use think\validate;

class User extends validate {


	protected $rule = [
		'realname'=>['require'],
	];

	protected $message = [
		'realname.require'=>'姓名不能为空',
	];

	protected $scene  = [
		'add'=>['realname'],
		'update'=>['realname'],
	];



}

