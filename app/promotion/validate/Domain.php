<?php 
/*
 module:		域名池验证器
 create_time:	2021-01-04 10:21:14
 author:		
 contact:		
*/

namespace app\promotion\validate;
use think\validate;

class Domain extends validate {


	protected $rule = [
		'title'=>['require','unique:promotion_domain'],
		'domain'=>['require','regex'=>'/^((ht|f)tps?):\/\/([\w\-]+(\.[\w\-]+)*\/)*[\w\-]+(\.[\w\-]+)*\/?(\?([\w\-\.,@?^=%&:\/~\+#]*)+)?/'],
	];

	protected $message = [
		'title.require'=>'标题不能为空',
		'title.unique'=>'标题已经存在',
		'domain.require'=>'域名不能为空',
		'domain.regex'=>'域名格式错误',
	];

	protected $scene  = [
		'add'=>['title','domain'],
		'update'=>['title','domain'],
	];



}

