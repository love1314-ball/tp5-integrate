<?php

namespace app\index\controller;

use app\common\controller\IndexBase;
use think\Db;
use think\response\Json;
use think\Session;
use think\Request;

class Api extends IndexBase
{
    public function payment()
    {
        /*
         * $data['superior_user_id']    上级用户id/团主用户id
         * $data['group_follow']        获取一下拼团表id
         * */
        $user_phone               = session('user_phone');
        $data['goods_id']         = input('goods_id');
        $data['user_phone']       = session('user_phone');
        $data['alone']            = input('alone');
        $data['single']           = input('single');
        $data['superior_user_id'] = input('superior_user_id');
        $data['group_follow']     = input('group_id');

        if (!$user_phone) {
            echo '<script type="text/javascript">
            window.alert("请登录账户"); 
            window.location.href = "http://www.tp5-integrate.com/index/index/disembark"
            </script>';
        }

        /*
         *  $data['alone'] = 0;     0无值, 代表参团/1代表自己开团，或者单独购买
         * $data['single'] = 0;     0代表参加拼团  /1代表自己购买，不参加任何团，购买过后直接发货
         * */
        if (!$data['alone']) {
            $data['alone'] = 0;
        }
        if (!$data['single']) {
            $data['single'] = 0;
        }

        $all = Db::name('goods')->where('id', $data['goods_id'])->find();
        /**
         *  获取商品信息
         *  查找拼团信息
         */
        if ($data['superior_user_id']) {
            $user   = Db::name('group')->where('group_follow', $data['group_follow'])->select();
            $direct = Db::name('user')->where('id', $data['superior_user_id'])->find();
            //上级信息
            if ($user) {
                //如果有下级用户
                $own = $this->own($user, $direct);
                //获取团的所有信息
                $this->assign('user', $own);
                //所有下级信息
            }
            $direct['phone']    = substr_replace($direct['phone'], '****', 4, 4);
            $direct['password'] = substr_replace($direct['password'], '****', 5, 20);
            $this->assign('direct', $direct);
            //团主信息
        }
        /**
         * 查找拼团信息结束
         *   --查拼团表的条件团主id
         */

        $where['id'] = $data['group_follow'];
        $below       = Db::name('group')->where($where)->select();
        $this->assign('data', $data);
        //input接受参数
        $this->assign('all', $all);
        //商品信息
        return $this->fetch('index/payment');
    }

    //购买/拼团表数据

    public function purchase()
    {
        $group['user_phone']        = session('user_phone');
        $group['user_id']           = session('user_id');
        $group['group_add_time']    = time();
        $group['goods_id']          = input('goods_id');
        $finish                     = Db::name('goods')->where('id', $group['goods_id'])->find();
        $group['group_finish_time'] = date('Y-m-d H:i:s', time() + $finish['goods_duration'] * 60 * 60);
        /*
         * $alone                       如果为0就是参加别人的团 /为1那么就是自己开的团
         * $group['goods_single']       0代表参加拼团  /1代表自己购买，不参加任何团，购买过后直接发货
         * $group['superior_user_id']   接收团主id
         * */
        $alone                     = input('alone');
        $group['goods_single']     = input('goods_single');
        $group['superior_user_id'] = input('superior_user_id');

        $order['user_phone']     = session('user_phone');
        $order['user_id']        = session('user_id');
        $order['order_mark']     = rand(0, 9999999999999999);
        $order['goods_id']       = input('goods_id');
        $order['order_add_time'] = $group['group_add_time'];
        /*
         * 增加订单表
         * --单独购买，不拼团购买
         * */


        if ($alone == 1) {
            /*
             * $alone == 1                          是否单独购买/1;
             * $group['group_master'] = 0;          是否为团主/0代表团主/1代表非团主
             * $group['group_follow'] = 0;          非团主时/团主的id/ 为团主的时候为0
             * $group['superior_user_id'] = 0;      上级团主的id /因为是自己购买所以上级id为0
             * -- 订单表
             *  $order['group_alone'] = 1;          等于1，说明自己购买的没有使用团购
             * */
            $order['group_alone']      = 1;
            $group['group_master']     = 0;
            $group['group_follow']     = 0;
            $group['superior_user_id'] = 0;
            Db::name('order')->insert($order);
            $gr = Db::name('group')->insert($group);
        }

        /*
         *--非单独购买，拼团购买
         */

        if ($alone == 0) {
            /*
             * $alone == 0                                      拼团购买的
             * group_master                                     是否为团主/0代表团主/1代表非团主
             * group_follow                                     非团主时/团主的id/ 为团主的时候为0
             * $group['superior_user_id'] == $group['user_id'] 判断自己不能参加自己开的团
             * --订单表
             *  $order['group_alone'] = 0;                      等于1说明是拼团购买的
             * */
            $order['group_alone']  = 0;
            $group['group_master'] = 1;
            $group['group_follow'] = input('group_id');
            if ($group['superior_user_id'] == $group['user_id']) {
                echo '<script type="text/javascript">
                window.alert("不能参加自己开的团"); 
                window.location.href = "http://www.tp5-integrate.com/index"
                </script>';
                exit;
            } else {
                /*
                 * 不是自己 的团
                 * */
                $whre['group_follow'] = $group['group_follow'];
                $whre['goods_id']     = $group['goods_id'];
                $whre['user_id']      = $group['user_id'];
                $twice                = Db::name('group')->where($whre)->find();//判断是不是一个团你参加了两次！
                if ($twice) {
                    //如果一个团你参加了两次报错
                    echo '<script type="text/javascript">
                    window.alert("你已经参加过本团了"); 
                    window.location.href = "http://www.tp5-integrate.com/index"
                    </script>';
                    exit;
                } else {
//                    group_follow //团主的id /要计算一下我们的团人数是否已经满
                    $junior['group_follow'] = $group['group_follow'];
                    $junior['goods_id']     = $group['goods_id'];
                    $number                 = Db::name('group')->where($junior)->count();
                    $number                 = $number + 1;
                    //团队下的人数( 加一因为要算上自己 )
                    /*
                     * 判断用户是否已满
                     * */
                    if ($number > $finish['goods_group']) {
                        echo '<script type="text/javascript">
                            window.alert("团人已满"); 
                            window.location.href = "http://www.tp5-integrate.com/index"
                            </script>';
                        exit;
                    }
                    if ($number == $finish['goods_group']) {
                        echo '<script type="text/javascript">
                            window.alert("团人已满"); 
                            window.location.href = "http://www.tp5-integrate.com/index"
                            </script>';
                        exit;
                    }
                    Db::name('order')->insert($order);
                    $gr = Db::name('group')->insert($group);
                }
            }
        }
        /*
         * 判断拼图表信息是否插入成功
         * */
        if ($gr) {
            echo '<script type="text/javascript">
            window.alert("购买成功");
            window.location.href = "http://www.tp5-integrate.com/index"
            </script>';
        } else {
            echo '<script type="text/javascript">
            window.alert("网络错误！请重新下单"); 
            window.location.href = "http://www.tp5-integrate.com/index"
            </script>';
        }
    }

    //处理-查找下级的信息

    public function own($user, $direct)
    {
        foreach ($user as $key => $value) {
            $own[]                    = Db::name('user')->where('id', $value['user_id'])->find();
            $own[$key]['superior_id'] = $direct['id'];
            //上级id
            $own[$key]['superior_phone'] = substr_replace($direct['phone'], '****', 4, 4);
            //上级的电话
            $own[$key]['phone']    = substr_replace($value['user_phone'], '****', 4, 4);
            $own[$key]['password'] = substr_replace($direct['password'], '****', 5, 20);
        }
        return $own;
    }

    //退出账号
    public function out()
    {
        session('user_phone', null);
        //清空session
        return 1;
    }
}
