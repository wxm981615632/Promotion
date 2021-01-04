<?php 
/*
 module:		统计报表验证器
 create_time:	2021-01-02 14:49:20
 author:		
 contact:		
*/

namespace app\promotion\validate\Report;
use think\validate;

class Record extends validate {


	protected $rule = [
		'soft_id'=>['require'],
		'mobile'=>['require','regex'=>'/^1[3456789]\d{9}$/'],
		'create_time'=>['require'],
	];

	protected $message = [
		'soft_id.require'=>'应用不能为空',
		'mobile.require'=>'手机号不能为空',
		'mobile.regex'=>'手机号格式错误',
		'create_time.require'=>'创建时间不能为空',
	];

	protected $scene  = [
		'add'=>['soft_id','mobile','create_time'],
		'update'=>['soft_id','mobile','create_time'],
	];



}

