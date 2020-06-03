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
        * 计算我们的拼团问题
        * */
        $goods_id              = input('goods_id');
        $where['goods_id']     = $goods_id;
        $where['goods_single'] = '0';
        //查找拼团的用户0/表示拼团的用户/1表示不拼团直接购买
        $data = Db::name('goods')->where('id', $where['goods_id'])->find();
        //获取商品信息
        /*
        * 获取所有团主信息
        * */
        $group = Db::name('group')->where($where)->select();
        //查找拼团表/判断团人数是否满了
        $user = $this->user($group, $goods_id, $data);
        //获取团主信息/将电话号隐藏/时间问题已经判断
        /*
        * 判断团信息，团的人数是否已经够了
        * */
        foreach ($user as $key => $value) {
            $junior['group_follow'] = $value['id'];
            $junior['goods_id']     = $goods_id;
            $number                 = Db::name('group')->where($junior)->count();
            $user[$key]['number']   = $number + 1;//团队下的人数(加一因为要算上自己)
            if ($user[$key]['number'] == $data['goods_group']) {
                echo "人满"; //这里说明人满了
            }
        }
//        dump($group);
//        dump($user);
//        exit;
        $this->assign('user', $user);
        $this->assign('data', $data);
        return $this->fetch('particulars');
    }

    //隐藏电话号码

    public function user($group, $goods_id, $data)
    {
        $time = date('Y-m-d H:i:s');
        $all  = [];
        foreach ($group as $key => $value) {
            $junior['group_follow'] = $value['id'];
            $junior['goods_id']     = $goods_id;
            $number                 = Db::name('group')->where($junior)->count();
            $group[$key]['number']  = $number + 1;//团队下的人数(加一因为要算上自己)
            if ($group[$key]['number'] != $data['goods_group']) { //查看拼团表中的团队数量 / 不等于设置的拼团数量，然后输出
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
                        $all[$key]['completely']        = "1";//表示人已经满了
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

    public function s()
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
}
