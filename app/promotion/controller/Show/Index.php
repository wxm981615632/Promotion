<?php 
/*
 module:		前端展示
 create_time:	2020-12-31 16:58:49
 author:		
 contact:		
*/

namespace app\promotion\controller\Show;

use app\BaseController;
use think\facade\Db;
use think\facade\Env;
use think\facade\View;
use think\facade\Request;

class Index extends BaseController {


    public function index(){
        $code = input('param.code');
        $id = $code;
        //获取改二维码信息，取 promotion_record
        $info = Db::name('promotion_record')->alias('a')
                                            ->where('a.id',$id)
                                            ->join('promotion_user b','a.user_id=b.id')
                                            ->join('promotion_soft c','a.soft_id=a.id')
                                            ->field('a.id,b.realname user,c.name soft,b.head,c.file_url,c.background,c.logo,c.version')
                                            ->find();
        if(!$info){
            return "地址错误";
        }
        View::assign('info', $info);
        return View::fetch();
    }

    public function start(){
        $code = input('param.code');
        $id = $code;
        $mobile = input('param.mobile');
        $info = Db::name('promotion_record')->where('id',$id)->find();
        if(!$info){
            return "地址错误";
        }
        $forwarded = request()->header("x-forwarded-for");
        if($forwarded){
            $ip = explode(',',$forwarded)[0];
        }else {
            $ip = request()->ip();
        }
        Db::name('promotion_record')->insert([
            'user_id'=>$info['user_id'],
            'soft_id'=>$info['soft_id'],
            'mobile'=>$mobile,
            'create_time'=>time(),
            'str_ua'=>Request::header('user-agent'),
            'str_ip'=>$ip,
        ]);
        $soft = Db::name('promotion_soft')->where('id',$info['soft_id'])->find();
        $path = app()->getRootPath();
        return download($path.'public'.$soft['file_url'], $soft['name']);
    }

}

