//监听底部导航栏调整
mui('.mui-bar-tab').on('tap','a',function(){
    var url = this.getAttribute('href');
         id = this.getAttribute('id');
    mui.openWindow({
        id:id,
        url:url,
    });
})