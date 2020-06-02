<?php
namespace app\admin\controller;
header('Content-Type:text/html;charset=utf-8');
use think\Controller;
use think\Request;
use think\Loader;

class Indexhome extends Controller {

//轮播
    public function carousel() {
		if ( $_FILES['file']['name'] == '' ) {
			//如果没有上传文件那么上传默认的图片
		    $arr = input('former');
		}else{
			$file = request()->file('file');
			foreach ($file as $item) {
				//移动到框架应用根目录/uploads/目录下
				$info = $item->move(ROOT_PATH . 'public' . DS . 'static/uploads');
				if ($info) {
					$saveName = str_replace("\\", "/", $info->getSaveName());
					$img = '/static/uploads/' . $saveName;
				} else {
					echo '文件上传失败' . '<br/>';
				}
				$data[] = explode(",", $img);
			}
			$arr = '';
			foreach ($data as $k => $v) {
				  $arr.=__UPLOADURL__.$v[0].",";
	//             $ggtop[$k]['photo']=__UPLOADURL__.$v['photo'];
			}
	//      dump($arr);exit;
			$fin['picture'] = $arr;
			$fin['time'] = date('Y-m-d h:i:s', time());
			$end = db('carousel')->where('id', 1)->update($fin);
			if ($end) {
				$this->success('增加成功');
			} else {
				$this->error('增加失败');
			}
		}
    }
	

}