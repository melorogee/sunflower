<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>向日葵少儿艺术学员中心</title>
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
    <meta content="telephone=no" name="format-detection"/>

    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="../studentAccount/css/main.css?v=2" />
    <script src="../studentAccount/js/zepto.min.js" type="text/javascript"></script>
    <script src="../studentAccount/js/flexiable.js?v=2" type="text/javascript"></script>
    <script src="../studentAccount/js/timetable.js?v=2" type="text/javascript"></script>

    <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
    <style>
        body{
            background-color:#f5f5f0;
        }
    </style>
</head>
<body >
<div class="container">
    <div id="table1"></div>
</div>
<script type="text/javascript">
    /*
      week代表星期几上课，
      seq代表第几节，
      dur表示上课长度，如2代表连上2节，
      evt代表具体内容。
    */
    var datas= [
        { "week": 1, "seq": 6, "dur": 1, "evt": "围棋启蒙班\n(3选2)" },
        { "week": 1, "seq": 5, "dur": 1, "evt": "美术大2班" },

        { "week": 2, "seq": 6, "dur": 1, "evt": "故事表演小班" },
        { "week": 3, "seq": 5, "dur": 1, "evt": "美术小1班"},

        { "week": 4, "seq": 3, "dur": 1, "evt": "美术小2班\n硬笔书法班" },
        { "week": 4, "seq": 4, "dur": 1, "evt": "动漫基础1班" },
        { "week": 4, "seq": 2, "dur": 1, "evt": "小主持人班\n围棋启蒙班\n(3选2)"},

        { "week": 5, "seq": 1, "dur": 1, "evt": "美术大1班" },
        { "week": 5, "seq": 2, "dur": 1, "evt": "舞蹈启蒙班\n围棋启蒙班\n(3选2)" },

    ];

    $("#table1").timeTable({
        classNum:"12",
        wlist:datas
    });



    var title = "向日葵少儿艺术-2018秋季班课表";//分享标题
    var desc = "查看向日葵少儿艺术-2018秋季班课表详情，快收藏我们吧~";//分享描述
    var link = "${wechatSign.pageUrl}";//分享链接
    var imgUrl = "http://sunarts.cn/sunflower/studentAccount/img/240-240logo.png";//图片图标

    wx.config({
        debug: false,
        appId: '${wechatSign.appid}',//公众号appid
        timestamp:'${wechatSign.timestamp}', //生成签名时间戳
        nonceStr:'${wechatSign.noncestr}', //生成签名随机字符串
        signature:'${wechatSign.signature}', //签名
        jsApiList: [
            'checkJsApi',
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ',
            'onMenuShareWeibo',
            'onMenuShareQZone'
        ]
    });
    wx.ready(function () {
        wx.onMenuShareTimeline({
            title: title, // 分享标题
            desc: desc, // 分享描述
            link: link, // 分享链接
            imgUrl: imgUrl, // 分享图标
            success: function () {
                // 用户确认分享后执行的回调函数
                console.log("test");
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });

        wx.onMenuShareAppMessage({
            title: title, // 分享标题
            desc: desc, // 分享描述
            link: link, // 分享链接
            imgUrl: imgUrl, // 分享图标
            //type: '', // 分享类型,music、video或link，不填默认为link
            //dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
                console.log("test");

            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });

        wx.onMenuShareQQ({
            title: title, // 分享标题
            desc: desc, // 分享描述
            link: link, // 分享链接
            imgUrl: imgUrl, // 分享图标
            success: function () {
                // 用户确认分享后执行的回调函数
                console.log("test");
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });

        wx.onMenuShareWeibo({
            title: title, // 分享标题
            desc: desc, // 分享描述
            link: link, // 分享链接
            imgUrl: imgUrl, // 分享图标
            success: function () {
                // 用户确认分享后执行的回调函数
                console.log("test");
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });

        wx.onMenuShareQZone({
            title: title, // 分享标题
            desc: desc, // 分享描述
            link: link, // 分享链接
            imgUrl: imgUrl, // 分享图标
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
    })

    $(function() {
    })


        var component = {
            goSearch: function () {
                if(null == $("#student_name").val() || undefined == $("#student_name").val() || "" == $("#student_name").val().trim()){
                    layer.msg("请输入学员姓名");
                }else{
                    $.ajax({
                        url: '/sunflower/students/goSearch.do',
                        type: 'POST',
                        dataType: 'json',
                        data: {
                            'student_name': $("#student_name").val()
                        },
                        async: false,
                        success: function (ret) {
                            if (ret) {
                                var id = ret["student_id"];
                                if(id == 0 ){
                                    layer.msg("该学员不存在");
                                }else{
                                    window.location.href = "/sunflower/students/studentAccount.do?id="+id;
                                }
                            }
                        }
                    });
                }
            }
        }
</script>

</body>

</html>
