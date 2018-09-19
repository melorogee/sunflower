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

    <link rel="stylesheet" type="text/css" href="../studentAccount/css/default.css" />
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="../studentAccount/css/search-form.css" />
    <script src="../studentAccount/js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="../studentAccount/layer/layer.js" type="text/javascript"></script>

    <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
    <link href="../layui/css/layui.css" rel="stylesheet">
    <script src="../layui/layui.js?v=1.0.0"></script>
</head>
<body>
    <div class="bg"></div>
    <div  style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;">
        <div class="logo" style=" margin: 20% auto auto auto; text-align: center">
            <img src="../studentAccount/img/240-240logo.png" alt="" style="width:100px;">
        </div>
        <div class="search-wrapper active">
            <div class="input-holder">
                <input type="text" class="search-input" placeholder="请输入学员姓名" id="student_name"/>
                <button class="search-icon" onClick="component.goSearch();"><span></span></button>
            </div>
            <div class="result-container">

            </div>
        </div>
    </div>



<script type="text/javascript">




    var title = "向日葵少儿艺术-学员中心";//分享标题
    var desc = "查找自己的孩子在向日葵的剩余课程，请假详情，作品展示，快收藏我们吧~";//分享描述
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
