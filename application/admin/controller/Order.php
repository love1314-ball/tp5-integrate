<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\Db;

class Order extends AdminBase
{

    protected function _initialize()
    {
        parent::_initialize();
    }

    public function index()
    {
        $whether = 0;
        if (input('user_phone')) {
            $where['a.user_phone'] = input('user_phone');
            $whether               = 1;
        }
        if (input('order_mark')) {
            $where['a.order_mark'] = input('order_mark');
            $whether               = 1;
        }
        if ($whether == 0) {
            $all = Db::name('order a')
                ->join('goods b', 'a.goods_id = b.id')
                ->field('a.*, b.goods_name,b.goods_image,b.id , a.id order_id , b.id goods_id')
                ->select();
        } else {
            $all = Db::name('order a')
                ->where($where)
                ->join('goods b', 'a.goods_id = b.id')
                ->field('a.*, b.goods_name,b.goods_image,b.id , a.id order_id , b.id goods_id')
                ->select();
        }
        $this->assign('all', $all);
        return $this->fetch('index');
    }

    //处理拼团信息
    public function group($all)
    {
        foreach ($all as $k => $v) {
            if ($v['goods_single'] == 1) {
                //表示自己购买不参加任何的团
                $all[$k]['goods_oneself'] = "单独购买";
            } else {
                $all[$k]['goods_oneself'] = "拼团购买";
            }
        }
        return $all;
    }

    //删除数据
    public function del()
    {
        $id  = input('id');
        $del = Db::name('order')->delete($id);
        if ($del) {
            $this->success('删除成功', 'admin/order/index');
        } else {
            $this->error('删除失败');
        }
    }

}
