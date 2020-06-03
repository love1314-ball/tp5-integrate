<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use think\Db;

class Group extends AdminBase
{

    protected function _initialize()
    {
        parent::_initialize();
    }

    public function index()
    {
        if (input('user_phone')) {
            $where['a.user_phone'] = input('user_phone');
        }
        if (input('goods_single')) {
            $where['a.goods_single'] = input('goods_single');
        } else {
            $where['a.group_master'] = 0;//为团主
        }
        $all = Db::name('group a')
            ->where($where)
            ->join('goods b', 'a.goods_id = b.id')
            ->field('a.*, b.* , a.id group_id , b.id goods_id')
            ->select();
        $all = $this->group($all);
        $this->assign('all', $all);
//        dump($all);exit;
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


    //查看团队信息
    public function dumpling()
    {
        $goods_id              = input('group_follow');
        $advocate              = Db::name('group')->where('id', $goods_id)->find();//团主信息
        $where['group_follow'] = $goods_id;
        $subordinate           = Db::name('group')->where($where)->select();//找下级用户
        $this->assign('advocate', $advocate);
        $this->assign('subordinate', $subordinate);
//        dump($goods_id);
//        exit;
        return $this->fetch('dumpling');
    }

    //删除
    public function del()
    {
        $id  = input('id');
        $del = Db::name('group')->delete($id);
        if ($del) {
            $this->success('删除成功', 'admin/group/index');
        } else {
            $this->error('删除失败');
        }
    }


    //导出内容

    public function export()
    {
        $whether = 0;
        if (input('user_phone')) {
            $where['a.user_phone'] = input('user_phone');
            $whether               = 1;
        }
        if (input('goods_single')) {
            $where['a.goods_single'] = input('goods_single');
            $whether                 = 1;
        }
        if ($whether == 0) {
            $all = Db::name('group a')
                ->join('goods b', 'a.goods_id = b.id')
                ->field('a.*, b.* , a.id group_id , b.id goods_id')
                ->select();
        } else {
            $all = Db::name('group a')
                ->where($where)
                ->join('goods b', 'a.goods_id = b.id')
                ->field('a.*, b.* , a.id group_id , b.id goods_id')
                ->select();
        }
        foreach ($all as $k => $v) {
            $all[$k]['group_add_time'] = date("Y-m-d H:i", $v['group_add_time']);//时间戳转为时间格式
            if ($v['goods_single'] == 0) {
                $all[$k]['goods_single'] = "拼团购买";
            } else {
                $all[$k]['goods_single'] = "单独购买";
            }
        }
        //    读取数据+搜索
        $fileName = '订单表' . date('_YmdHis');
        //查询表中所有的数据/ 这个自己要进行更改/以及下面的表头和数据库都要进行更改
        $data = '';
        $data = $data . '<table class="bioage" border="2">
        <tr>
        <td>ID</td>
        <td>用户手机号</td>
        <td>用户id</td>
        <td>上级用户id/0表示自己是团主</td>
        <td>商品id</td>
        <td>商品名字</td>
        <td>购买类型</td>
        <td>拼团时间</td>
        <td>拼团价格</td>
        <td>单购价格</td>
        <td>拼团有效期/小时</td>
        </tr>';
        //声名变量然后拼接一个表头
        foreach ($all as $v) {
            //遍历输出

            $data = $data . "<tr>
                <td>{$v['group_id']}</td> " .
                "<td>{$v['user_phone']} </td> " .
                "<td>{$v['user_id']} </td> " .
                "<td>{$v['superior_user_id']} </td> " .
                "<td>{$v['goods_id']} </td> " .
                "<td>{$v['goods_name']} </td> " .
                "<td>{$v['goods_single']} </td> " .
                "<td>{$v['group_add_time']} </td> " .
                "<td>{$v['goods_group_price']} </td> " .
                "<td>{$v['goods_price']} </td> " .
                "<td>{$v['goods_duration']} </td> " .
                '</tr>';
            //声名变量拼接输出 所有值
        }
        $data = $data . '</table>';
        //结束标签
        //打印看看是否有值
        header('pragma:public');
        //缓存问题，开启之后为了防止有缓存
        header('Content-type:application/vnd.ms-excel;charset=utf-8;name="' . $fileName . '.xls"');
        //类型为xls表格的形式是。
        header("Content-Disposition:attachment;filename=$fileName.xls");
        //弹出下载窗口，下载文件的名字就为我们前面传过来的名字格式为表格
        echo '<html>' . "<meta charset='UTF-8'>" . $data . '</html>';
        //输出我们的内容在xls中我们防止的乱码
    }
}
