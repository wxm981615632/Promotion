<?php 
/*
 module:		应用管理验证器
 create_time:	2020-12-31 16:35:08
 author:		
 contact:		
*/

namespace app\promotion\validate\Soft;
use think\validate;

class Index extends validate {


	protected $rule = [
		'name'=>['require'],
		'file_url'=>['require'],
		'background'=>['require'],
	];

	protected $message = [
		'name.require'=>'应用名称不能为空',
		'file_url.require'=>'文件链接不能为空',
		'background.require'=>'背景图片不能为空',
	];

	protected $scene  = [
		'add'=>['name','file_url','background'],
		'update'=>['name','file_url','background'],
	];



}

