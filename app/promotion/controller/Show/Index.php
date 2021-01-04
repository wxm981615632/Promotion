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

    private function checkDomain(){

    }

    public function index(){
        $code = input('param.code');
        $domain = Request::root(true);
        $is_main = Db::name('promotion_domain')->where('is_main',1)->where('domain',$domain)->count();
        if($is_main){
            $domain_list = Db::name('promotion_domain')->where('is_main',0)->select();
            if($domain_list){
                $domain = $domain_list[rand(0,count($domain_list)-1)]['domain'];
                //http://base.smallchen.com/promotion/Show.index/index?code=1
                return redirect($domain.'/Show.index/index?code='.$code,301);
            }
        }

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
        $user_agent = Request::header('user-agent');
        if (strpos($user_agent, 'MicroMessenger') !== false) {
            // 微信浏览器禁止提交
            return $this->error("请使用非微信浏览器打开");
        }
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
            'str_ua'=>$user_agent,
            'str_ip'=>$ip,
        ]);
        $soft = Db::name('promotion_soft')->where('id',$info['soft_id'])->find();
        $path = app()->getRootPath();
        return download($path.'public'.$soft['file_url'], $soft['name']);
    }

}

