<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\Db;
use think\Request;

//我是商品管理

class Goods extends AdminBase
{
    //公共部分
    protected function _initialize()
    {
        parent::_initialize();
    }

    //用户首页

    public function index()
    {
        $all = Db::name('goods')->select();
        $this->assign('all', $all);
        return $this->fetch('index');
    }

    public function duqu()
    {
        $all = Db::name('goods')->select();
        return json($all);
    }


    //增加页面
    public function add()
    {
        $up = input('up');
        if ($up) {
            $all = Db::name('goods')->where('id', $up)->find();
            $this->assign('all', $all);
            $this->assign('id', $up);
        }
        return $this->fetch('add');
    }

    //跟新和插入

    public function edit()
    {
        $request = Request::instance();
        //获取域名使用
        $data = [
            'id'                => input('id'),
            'goods_name'        => input('goods_name'),
            'goods_introduce'   => input('goods_introduce'),
            'goods_group'       => input('goods_group'),
            'goods_group_price' => input('goods_group_price'),
            'goods_price'       => input('goods_price'),
            'goods_duration'    => input('goods_duration')
        ];
        // 图片上传
        $picture = '';
        if ($_FILES['goods_image']['name'] == '') {
            $data['goods_image'] = input('worn_image');
        } else {
            $file = request()->file('goods_image');
            //tp5写法获取图片信息
            $info = $file->move(ROOT_PATH . '/public/static/upimg/');
            if ($info) {
                $Nmae = $info->getSaveName();
                //获取临时名字
                $site                = str_replace('\\', '/', $Nmae);
                $data['goods_image'] = $request->domain() . '/static/upimg/' . $site;
            } else {
                // 上传失败获取错误信息
                echo $file->getError();
            }
        }
        //轮播上传
        if ( $_FILES['goods_carousel']['name'][0] == '' ) {
            //如果没有上传文件那么上传默认的图片
            $data['goods_carousel'] = input( 'worn_carousel' );//接收默认图片
        } else {
            $file = request()->file('goods_carousel');
            foreach ($file as $item) {
                //移动到框架应用根目录/uploads/目录下
                $info = $item->move(ROOT_PATH . 'public' . DS . 'static/uploads');
                if ($info) {
                    $saveName = str_replace('\\', '/', $info->getSaveName());
                    $img      = '/static/uploads/' . $saveName;
                } else {
                    echo '文件上传失败' . '<br/>';
                }
                $all[] = explode(',', $img);
            }
            $arr = '';
            foreach ($all as $k => $v) {
                $arr .= $request->domain() . $v[0] . ',';
            }
            $data['goods_carousel'] = $arr;
        }
        if ($data['id']) {
            //更新信息开始
            $update = Db::name('goods')->update($data);
            if ($update) {
                $this->success('更新成功', 'admin/goods/index');
            } else {
                $this->error('更新失败');
            }
            //更新结束
        } else {
            //我是插入/插入开始
            $add = Db::name('goods')->insert($data);
            if ($add) {
                $this->success('增加成功', 'admin/goods/index');
            } else {
                $this->error('增加失败');
            }
        }
        //插入结束

    }

    //删除数据

    public function del()
    {
        $id  = input('id');
        $del = Db::name('Goods')->delete($id);
        if ($del) {
            $this->success('删除成功', 'admin/Goods/index');
        } else {
            $this->error('删除失败');
        }
    }


}
