<?php

namespace app\promotion\controller;

class Index extends Admin
{
	
    public function index(){
		$this->view->assign('menus',$this->getSubMenu(0));
		return view('index');
    }
	
	
	public function main(){
		return view('main');
	}
	
	
	//生成左侧菜单栏结构列表 递归的方法
	public function getSubMenu($pid){
		$list = db("menu")->where(['status'=>1,'app_id'=>209,'pid'=>$pid])->order('sortid asc')->select()->toArray();
		if($list){
			$menus = [];
			foreach($list as $key=>$val){
				$sublist = db("menu")->where(['status'=>1,'app_id'=>209,'pid'=>$val['menu_id']])->order('sortid asc')->select()->toArray();
				if($sublist){
					$menus[$key]['sub'] = $this->getSubMenu($val['menu_id']);
				}
				$menus[$key]['title'] = $val['title'];
				$menus[$key]['icon'] = !empty($val['menu_icon']) ? $val['menu_icon'] : 'fa fa-clone';
				$menus[$key]['url'] = !empty($val['url']) ? (strpos($val['url'], '://') ? $val['url'] : url($val['url'])) : url('promotion/'.str_replace('/','.',$val['controller_name']).'/index');
			}
			return $menus;
		}	
	}
	
	
}
