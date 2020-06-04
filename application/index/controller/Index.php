<?php

namespace app\index\controller;

use app\common\controller\IndexBase;
use think\Db;
use think\Session;

class Index extends IndexBase
{

    //前端 / 首页

    public function index()
    {
        $username = $this->usernames();
        $data     = Db::name('goods')->select();
        $this->assign('username', $username);
        $this->assign('data', $data);
        return $this->fetch('index');
    }

    //商品详情页面

    public function particulars()
    {
        /*
        * 计算团的人数是否超了；
        * $where['goods_single'] = '0';
        查找拼团的用户0/表示拼团的用户/1表示不拼团直接购买
        * $data  获取商品信息
        * */
        $goods_id              = input('goods_id');
        $where['goods_id']     = $goods_id;
        $where['goods_single'] = '0';
        $data                  = Db::name('goods')->where('id', $where['goods_id'])->find();
        /*
        * 获取所有团主信息
        *   $group 查找拼团表/判断团人数是否满了
        *
        * */
        $group = Db::name('group')->where($where)->select();
        $user  = $this->user($group, $goods_id, $data);
        /*
        * 获取团主信息/将电话号隐藏/时间问题已经判断
        * 判断团信息，团的人数是否已经够了
        * */
        $this->assign('user', $user);
        $this->assign('data', $data);
//        dump($user);
//        exit;
        return $this->fetch('particulars');
    }

    /*
    * /隐藏电话号码
    *  /团人数是否满了
    * */

    public function user($group, $goods_id, $data)
    {
        $time = date('Y-m-d H:i:s');
        $all  = [];
        foreach ($group as $key => $value) {
            $junior['group_follow'] = $value['id'];
            $junior['goods_id']     = $goods_id;
            $number                 = Db::name('group')->where($junior)->count();
            $group[$key]['number']  = $number + 1;
            //团队下的人数( 加一因为要算上自己 )
            if ($group[$key]['number'] != $data['goods_group']) {
                //查看拼团表中的团队数量 / 不等于设置的拼团数量，然后输出
                if ($time < $value['group_finish_time']) {
                    if ($value['group_master'] == 0) {
                        $all[$key]['id']                = $value['id'];
                        $all[$key]['user_phone']        = substr_replace($value['user_phone'], '****', 4, 4);
                        $all[$key]['user_id']           = $value['user_id'];
                        $all[$key]['group_master']      = $value['group_master'];
                        $all[$key]['group_follow']      = $value['group_follow'];
                        $all[$key]['group_add_time']    = $value['group_add_time'];
                        $all[$key]['group_finish_time'] = $value['group_finish_time'];
                        $all[$key]['goods_id']          = $value['goods_id'];
                        $all[$key]['goods_single']      = $value['goods_single'];
                        $all[$key]['group_master']      = $value['group_master'];
                        $all[$key]['completely']        = '1';
                        //  $all[$key]['completely']        = '1';表示人已经满了
                        $all[$key]['number'] = $data['goods_group'] - $group[$key]['number'];
                        //   $all[$key]['number']  表示拼团剩余人数
                    }
                }
            }
        }
        return $all;
    }

    //商品详情 轮播图显示

    public function carousel()
    {
        $id   = input('id');
        $data = Db::name('goods')->where('id', $id)->value('goods_carousel');
        $data = rtrim($data, ',');
        $data = explode(',', $data);
        return json($data);
    }

    //我的个人中心

    public function center()
    {
        return $this->fetch('center');
    }

    //登录页面

    public function disembark()
    {
        return $this->fetch('disembark');
    }

    //注册页面

    public function login()
    {
        return $this->fetch('login');
    }

    //用户注册

    public function registration()
    {
        $data['phone']    = input('phone');
        $data['mailbox']  = input('phone') . '@163.com';
        $data['password'] = md5(input('password'));
        $phone            = Db::name('user')->where('phone', $data['phone'])->find();
        if ($phone) {
            return 1;
            //存在账户
        } else {
            $in = Db::name('user')->insert($data);
            if ($in) {
                return 2;
                //插入成功
            } else {
                return 3;
                //网络错误
            }
        }
    }

    //用户登录

    public function verify()
    {
        $where['phone']    = input('phone');
        $where['password'] = md5(input('password'));
        $data              = Db::name('user')->where($where)->find();
        if ($data) {
            $user_phone = session('user_phone', $data['phone']);
            //存入session值
            $user_id = session('user_id', $data['id']);
            //存入session值
            return 1;
            //登录成功
        } else {
            return 2;
            //账户或者密码错误
        }
    }

    //判断session

    public function usernames()
    {
        $username = session('user_phone');
        return $username;
    }

    //个人订单信息

    public function order()
    {
        $user_id    = session('user_id');
        $user_phone = session('user_phone');
        if (!$user_phone) {
            echo '<script type="text/javascript">
            window.alert("请登录账户"); 
            window.location.href = "http://www.tp5-integrate.com/index/index/disembark"
            </script>';
        }
        $where['a.user_phone'] = $user_phone;
        $order                 = Db::name('order a')
            ->where($where)
            ->join('goods b', 'a.goods_id = b.id')
            ->field('a.*, b.*, a.id order_id , b.id goods_id')
            ->select();
        $this->assign('order', $order);
        return $this->fetch('order');
    }

}
