<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="black" name="apple-mobile-web-app-status-bar-style"/>
    <meta content="telephone=no" name="format-detection"/>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
    <link href="../studentAccount/css/style.css" rel="stylesheet" type="text/css"/>
    <!--全局CSS样式开始-->
    <link rel="stylesheet" href="../studentAccount/Assets/Css/reset.css" />
    <link rel="stylesheet" type="text/css" href="../studentAccount/Assets/Css/common.css" />
    <!--图标字体-->
    <link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_1414637576_801088.css"/>
    <!--全局CSS样式结束-->
    <title>向日葵少儿艺术-老师排课</title>
    <!--页面CSS样式开始-->
    <link rel="stylesheet" type="text/css" href="../studentAccount/Assets/Css/page_index.css"/>
    <!--全局JS包含文件开始-->
    <script type="text/javascript" src="../studentAccount/Assets/Js/jquery.min.js"></script>
    <script type="text/javascript" src="../studentAccount/Assets/Js/common.js"></script>
</head>
<body>
<!--头部开始-->
<div class="header_pic">
    <img src="../studentAccount/Assets/Images/banner_top.jpg" />
</div>
<div class="space_hx">&nbsp;</div>
<!--头部结束-->
<!--主体开始-->
<div class="main" id="content">
</div>
<!--主体结束-->
<!--返回顶部开始-->
<div class="backtop" id="backtop">
    <a href="javascript:window.scrollTo(0,0)">
        <i class="iconfont icon-xiangshang"></i>
    </a>
</div>
<!--返回顶部结束-->
</body>

<script type="text/javascript">

    var title = "向日葵少儿艺术-老师班级表";//分享标题
    var desc = "老师对应班级以及学生信息";//分享描述
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
        component.initDetailInfo();
    })


        var component = {
            initDetailInfo: function () {
                $.ajax({
                    url: '/sunflower/students/get_teachar_class_info.do',
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        'student_id': $("#student_id").val()
                    },
                    async: false,
                    success: function (ret) {
                        if (ret) {
                            var teacher_list = ret;
                            var html = "";
                            for (var i = 0; i < teacher_list.length; i++) {
                                var  temp_html = "<div class=\"main_case\">\n" +
                                    "<h1 class=\"mc_title\" > "+teacher_list[i]["teacher_name"]+"  " +
                                    "<span class=\"title_icon\">\n" +
                                    "<i class=\"iconfont icon-xiangshang\"></i>" +
                                    "</span>\n" +
                                    "</h1>" +
                                    "<div class=\"mc_list\">";

                                var teacher_class = teacher_list[i]["teacher_class"];
                                var class_html = "";
                                for(var j = 0; j < teacher_class.length; j++){
                                     var temp_class = "<a href=\"#\">" +
                                        "<dl class=\"clearfix\">" +
                                        "<dt><img  src=\"../studentAccount/Assets/Images/"+teacher_class[j]["class_id"]+".jpg\" " +
                                        "</dt><dd>" +
                                        "<ul>"
                                    var student_html = "";
                                    var teacher_class_student = teacher_class[j]["student_list"];
                                    for(var x = 0; x < teacher_class_student.length; x++){
                                        var goon = teacher_class_student[x]["goon"];
                                        var goon_txt = "";
                                        if(goon == '1'){
                                            goon_txt ="<font color='green'>报名</font>"
                                        }else{
                                            goon_txt ="<font color='red'>不报</font>"
                                        }
                                        student_html += "<li>"+teacher_class_student[x]["student_name"]+"("+goon_txt+teacher_class_student[x]["left_class"]+")</li>"
                                    }
                                    class_html += (temp_class + student_html + "</ul>" +
                                        "</dd><dd class=\"mc_icon\"><i class=\"iconfont icon-xiangyou\"></i></dd></dl>" +
                                        "</a>");
                                  }
                                temp_html = temp_html + class_html + "</div>" +
                                    "</div>";
                                html += temp_html;
                        }
                            $("#content").html(html);
                    }
                    }
                });
            }
        }
</script>

</body>

</html>
