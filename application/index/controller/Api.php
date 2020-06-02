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
        $user_phone = session('user_phone');
        if (!$user_phone) {
            echo '<script type="text/javascript">window.alert("请登录账户"); window.location.href = "http://www.tp5-integrate.com/index/index/disembark"</script>';
        }
        $data['goods_id']   = input('goods_id');
        $data['user_phone'] = session('user_phone');
        // $data['group_id']         = input( 'group_id' );
        //接收一下我们的拼团表的id
        $data['alone']            = input('alone');
        $data['single']           = input('single');
        $data['superior_user_id'] = input('superior_user_id');
        //上级用户id/团主用户id
        $data['group_follow'] = input('group_id');
        //获取一下团主id

        if (!$data['alone']) {
            $data['alone'] = 0;
            //0无值, 代表参团/1代表自己开团，或者单独购买
        }
        if (!$data['single']) {

            $data['single'] = 0;
            //0代表参加拼团  /1代表自己购买，不参加任何团，购买过后直接发货
        }
        $all = Db::name('goods')->where('id', $data['goods_id'])->find();
        //获取商品信息

        /**
         * 查找拼团信息
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
//        dump($data);
//        exit;
        /**
         * 查找拼团信息结束
         */

        //查拼团表的条件团主id
        $where['id'] = $data['group_follow'];
        //查找团主的id从而查找他的下级
        $below = Db::name('group')->where($where)->select();
//            dump( $data );
//            dump( $all );
//             exit;
        $this->assign('data', $data);
        //参数
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
        $finish                     = Db::name('goods')->where('id', $group['goods_id'])->value('goods_duration');
        $group['group_finish_time'] = date('Y-m-d H:i:s', time() + $finish * 60 * 60);
        //结束时间/查有效时间
        $alone = input('alone');
        //如果为0就是参加别人的团 /为1那么就是自己开的团
        $group['goods_single'] = input('goods_single');
        //0代表参加拼团  /1代表自己购买，不参加任何团，购买过后直接发货
        $group['superior_user_id'] = input('superior_user_id');
        //接收团主id
        if ($alone == 1) {
            //$group['group_alone']  = 1;
            //是否单独购买/1;
            //订单表要使用
            $group['group_master'] = 0;
            //是否为团主/0代表团主/1代表非团主
            $group['group_follow'] = 0; //这个要不要应该都可以
            //非团主时/团主的id/ 为团主的时候为0
            $group['superior_user_id'] = 0;
            //上级团主的id
            $gr = Db::name('group')->insert($group);
        }
        if ($alone == 0) {
            //拼团购买的
            $group['group_master'] = 1;
            //是否为团主/0代表团主/1代表非团主
            $group['group_follow'] = input('group_id');
            //非团主时/团主的id/ 为团主的时候为0
            $group['superior_user_id'] = $group['superior_user_id'];
            //上级团主的id
            if ($group['superior_user_id'] == $group['user_id']) {
                echo '<script type="text/javascript">window.alert("不能参加自己开的团"); window.location.href = "http://www.tp5-integrate.com/index"</script>';
            } else {
                $gr = Db::name('group')->insert($group);
            }
        }
//        dump($group);
//        exit;
        if ($gr) {
            $request = Request::instance();
            $Url     = $request->domain() . '/index/index/index';
            echo '<script type="text/javascript">window.alert("购买成功"); window.location.href = "http://www.tp5-integrate.com/index"</script>';
        } else {
            echo '<script type="text/javascript">window.alert("网络错误！请重新下单"); window.location.href = "http://www.tp5-integrate.com/index"</script>';
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

    //2曲艺曲种

    public function skill()
    {
        $song_id = input('song_id');
        if ($song_id) {
            //选择了某一个类
            $song_id = $song_id;
        } else {
            //没有选择那么我就默认为1
            $song_id = 1;
        }
        $play = Db::name('play')->where('song_id', $song_id)->select();
        //查找表play条件为你选中的戏曲id
        $empty = '0';
        //$empty判断内容是否为空0代表为空  -- 1代表有值
        if (!$play) {
            $empty = '1';
        }
        $this->assign('empty', $empty);
        //页面赋值
        $all = Db::name('song')->order('id')->select();
        //查找song表所有数据排序倒序
        $this->assign('all', $all);
        //将song表数据赋值给前端
        $this->assign('play', $play);
        //将plsy表中的数据赋值给前端
        $username = $this->usernames();
        $this->assign('username', $username);
        return $this->fetch('skill');
    }

    //3曲艺赏析

    public function appreciate()
    {
        $all = Db::name('play')->select();
        //查play表所有数据
        foreach ($all as $key => $value) {
            $all[$key]['song_name'] = Db::name('song')->where('id', $value['song_id'])->value('song_name');
            //循环一下将song表相关的数据进行关联
        }
        $username = $this->usernames();
        $this->assign('username', $username);
        $this->assign('all', $all);
        //页面赋值
        return $this->fetch('appreciate');
    }

    //4曲艺历史

    public function history()
    {
        $username = $this->usernames();
        $this->assign('username', $username);
        return $this->fetch('history');
    }

    //5登录注册

    public function register()
    {
        $username = $this->usernames();
        $this->assign('username', $username);
        return $this->fetch('register');
    }

    //《穆桂英挂帅》详细页面

    public function particular()
    {
        $play_id = input('play_id');
        $all     = Db::name('play')->where('id', $play_id)->find();
        $play    = Db::name('play')->where('song_id', $all['song_id'])->select();
        $empty   = '0';
        if (!$play) {
            $empty = '1';
        }
        $discuss = Db::name('discuss')->where('play_id', $play_id)->select();
        foreach ($discuss as $key => $value) {
            $discuss[$key]['user_name'] = Db::name('user', $value['user_id'])->value('username');
        }
        $review = '0';
        if (!$discuss) {
            $review = '1';
        }
        $username = $this->usernames();
        $this->assign('username', $username);
        $this->assign('play_id', $play_id);
        $this->assign('discuss', $discuss);
        $this->assign('empty', $empty);
        $this->assign('review', $review);
        $this->assign('play', $play);
        $this->assign('all', $all);
        return $this->fetch('particular');
    }

    // discuss  /评论

    public function discuss()
    {
        $username = session('user_name');
        if (!$username) {
            return 0;
        } else {
            $data['user_id'] = session('user_id');
            $data['content'] = input('content');
            $data['play_id'] = input('play_id');
            $in              = Db::name('discuss')->insert($data);
            if ($in) {
                return 1;
                //评论成功
            } else {
                return 2;
                //失败
            }
        }
    }

    public function login()
    {
        //当status为0的时候是登录，为1的时候是注册
        $status           = input('status');
        $data['password'] = input('password');
        $data['mailbox']  = input('mailbox');
        $data['username'] = input('user');
        // 接收表单中的值
        if ($status == 0) {
            $name = Db::name('user')->where('mailbox', $data['mailbox'])->find();
            //如果邮箱存在那么向下一步推进
            if ($name['password'] == $data['password']) {
                //密码也正确那么就登录成功了
                session('user_name', $name['username']);
                session('user_id', $name['id']);
                return 0;
                //登录成功
            } else {
                return 1;
                //账号或密码错误
            }
        } else {
            $in = Db::name('user')->insert($data);
            if ($in) {
                return 2;
                //注册成功
            } else {
                return 3;
                //注册失败
            }
        }
    }

    //获取用户session

    public function usernames()
    {
        $username = session('user_name');
        return $username;
    }

    //账户退出

    public function out()
    {
        session('user_phone', null);
        //清空session
        return 1;
    }
}
