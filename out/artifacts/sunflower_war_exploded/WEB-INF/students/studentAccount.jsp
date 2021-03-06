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
    <link href="../studentAcount/css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="../studentAcount/css/swiper.min.css">
    <style type="text/css">
        *, *:before, *:after {
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }
        body {
            margin: 0;
            padding: 0;
        }
        .swiper-container {
            width: 100%;
            padding-top: 10px;
            padding-bottom: 30px;
        }
        .swiper-slide {
            background-position: center;
            background-size: cover;
            width: 240px;
            height: 320px;

        }

        .swiper-slide a{
            color:#fff;
            font-size:16px;
            text-decoration:none;
            display:block;
            text-align:center;
            height:100%;
        }
        .swiper-slide h1{
            position:absolute;
            bottom:0;
            width:100%;
            font-size:18px;
            font-weight:normal;
            background:#900;
            padding-bottom: 0;
            margin:0;
            height:38px;
            line-height:38px;
            background: rgba(255, 255, 255, 0.4) none repeat scroll 0 0;
        }

        .mui-bar {
            position: fixed;
            z-index: 10;
            right: 0;
            left: 0;
            height: 44px;
            padding-right: 10px;
            padding-left: 10px;
            border-bottom: 0;
            background-color: #f7f7f7;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
        }

        .mui-bar-nav {
            top: 0;
        }
        .t-line {
            position: relative;
        }
        .t-line:before {
            content: " ";
            position: absolute;
            left: 0;
            top: 0;
            right: 0;
            height: 1px;
            border-top: 1px solid rgba(207, 207, 207, 0.95);
            color: rgba(207, 207, 207, 0.95);
            -webkit-transform-origin: 0 0;
            transform-origin: 0 0;
            -webkit-transform: scaleY(0.501);
            transform: scaleY(0.501);
        }

        .b-line {
            position: relative;
        }
        .b-line:before {
            content: " ";
            position: absolute;
            left: 0;
            bottom: 0;
            right: 0;
            height: 1px;
            border-bottom: 1px solid rgba(207, 207, 207, 0.95);
            color: rgba(207, 207, 207, 0.95);
            -webkit-transform-origin: 0 100%;
            transform-origin: 0 100%;
            -webkit-transform: scaleY(0.501);
            transform: scaleY(0.501);
        }
        .mui-title {
            font-size: 17px;
            font-weight: normal;
            line-height: 44px;
            position: absolute;
            display: block;
            width: 100%;
            margin: 0 -10px;
            padding: 0;
            text-align: center;
            white-space: nowrap;
            color: #000;
        }
        .mui-bar .mui-title {
            right: 40px;
            left: 40px;
            display: inline-block;
            overflow: hidden;
            width: auto;
            margin: 0;
            text-overflow: ellipsis;
        }
        .mui-title-text{
            text-align:center;
            color:#888;
            font-size:14px;
        }

        .mui-bar-tab {
            bottom: 0;
            display: table;
            width: 100%;
            height: 50px;
            padding: 0;
            table-layout: fixed;
            border-top: 0;
            border-bottom: 0;
            -webkit-touch-callout: none;
        }
        .mui-bar-tab .aui-tab-item {
            display: table-cell;
            overflow: hidden;
            width: 1%;
            height: 50px;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            text-overflow: ellipsis;
            color: #707070;
            text-decoration:none;
        }
        .mui-icon {
            font-family: Muiicons;
            font-size: 24px;
            font-weight: 400;
            font-style: normal;
            line-height: 1;
            display: inline-block;
            text-decoration: none;
            -webkit-font-smoothing: antialiased;
        }
        .mui-bar .mui-icon {
            font-size: 24px;
            position: relative;
            z-index: 20;
            padding-top: 10px;
            padding-bottom: 10px;
        }
        .mui-bar-tab .aui-tab-item .mui-icon {
            top: 4px;
            width: 19px;
            height: 19px;
            padding-top: 0;
            padding-bottom: 0;
        }
        .mui-bar-tab .aui-tab-item .mui-icon~.mui-tab-label {
            font-size: 12px;
            display: block;
            overflow: hidden;
            text-overflow: ellipsis;

        }
        .mui-icon-home {
            background-image: url('data:image/png;base64,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');
            background-size:19px;
            background-repeat:no-repeat;
        }

        .mui-icon-extra-class{
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFoAAABaCAYAAAA4qEECAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTM4IDc5LjE1OTgyNCwgMjAxNi8wOS8xNC0wMTowOTowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTcgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QTgyQ0NFRkQyODkwMTFFN0E4NzVFRTg5MkVFRjFGQ0UiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QTgyQ0NFRkUyODkwMTFFN0E4NzVFRTg5MkVFRjFGQ0UiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpBODJDQ0VGQjI4OTAxMUU3QTg3NUVFODkyRUVGMUZDRSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpBODJDQ0VGQzI4OTAxMUU3QTg3NUVFODkyRUVGMUZDRSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Ppal3XsAAAnHSURBVHja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');

            background-size:19px;
            background-repeat:no-repeat;
        }

        .mui-icon-extra-cart{
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFoAAABaCAYAAAA4qEECAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTM4IDc5LjE1OTgyNCwgMjAxNi8wOS8xNC0wMTowOTowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTcgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NkI5MDQ3NkUyODkxMTFFN0E4NzVFRTg5MkVFRjFGQ0UiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NkI5MDQ3NkYyODkxMTFFN0E4NzVFRTg5MkVFRjFGQ0UiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo2QjkwNDc2QzI4OTExMUU3QTg3NUVFODkyRUVGMUZDRSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo2QjkwNDc2RDI4OTExMUU3QTg3NUVFODkyRUVGMUZDRSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PsRIaaYAAAUASURBVHja7J37i0xhGMffY2etSy7Jat0jRck9l/IPSCm3UCQ/oFySQckvJJJCK7Qb+4PkGr8oilIirEtyDckt112XxFrszYzvY9+jaex5z/vOzpnzHvN869sw7zsz53zmnec8z3vePcdJJpOCFbzaMAIGzaBZDNpaxVr7BvF4PK8BlpaW8oiO/IjGKO6Oh9FwfZ7xKoCr4edwXSCgAXcYHpbA0+ASHqPiClwOH9bp7PgVLADcVwJe5ziO4ALnH10i4IjVRzMGDchDJeRlzNNXSwG73PhgCMglDNlIZWC2KJOsgyGbax9gj9MGjc4D8bCeuWWkJdoxGqAJ8kbFm1EG8hn+lYcgC+HXPn2KEa8/6aR34xVvMghv8izPK0PKpxfCez3ap8D7dWL0SMWHvODoIBLwXUV7P92CxasgWYTRnNBK0JFzu4pC7u1ur8G2NphMbbQxzEaSAWxwVOUo2pIm6R0ri2LQ/wNohI8+cCS+TGxne7h7ZEBjY3viYSV8TOablGuvgjtZyngsvA3+AX+Uadkk20FTWvgOptMOs1Oe3wHXwCMsgzwPvgGvSXluAXxGDhYrQXeDb/v0uSMrKxu0HD6oaKfBsthG0LM0+823ADKFsd0a/ajy628b6Lma/eZYUD7XGPSfYBvorpr92lpcaLSk9raBvqjZ71rIoE1nHG/ZBnqvZr+KsFNmud868+2b4Xu2gb6vcUCklO+pDfWJ5sGw3NY8+gQ8Q9HeZFEO/QU+q2jvIWsCa0vwJ1nITJqPWo4TJOghigpwi6wSrZ7roBBS5tE23ZJSnL7BmYr2h9n+wFhAO6I6gCzQjI9BQvY7eXHd9rkOV5WKtl1w7xBB++3z2iAO2EGBpvCxWtH+Bi4KfOgixrcQ5wf7vOxqGN9ua3TOp71O5P7EQzH84H8DTaN6nkaVlivYHeEPGplIU9RAk85rlsRBT512hmt9+tBk1+OwDgytVZVQTPanxM8GOeKyW/4lkwXwKPzzq0b302EegbOV6q3wAJH631r50y3K0n51lGFAZ1KoC/w96qBJezT7PZIHSVrAU4QvIma4LzQF206Go1rN6pLOGdYEDSCWI9DujFnCIOS46gV/ku/h2i08XIoU439o/GrSNRG+aUPyHgRs01WR72QMb5Sh4Jd0k3yu0QuyQltF8ymqSluqpCBg7xTN06UXQqoMN8Hb4Ve5/NBYSDt7HL4Mvw3hszcIjTWEUR/R6SGhIIefVyj3N5TVl2Ev10rIbWgXcLFSKGN6aEtcbVgXRztfL7elg8jeH4u6gL8JC87sxIQ9IuA/pd18uK3cxmqf17pL0Rrll1YX5ui1HXSq3LQtPb4WpvwKkzLNaxR2nYuMFOh0NaXMiURSvBCdQTNoFoNm0AyaETBoBs1i0AyaQbMYNINmMWgGzaBZDJpBsxg0g2bQLclr1afDyP5KtZzB0QX93uP5ing8zr+CZqkuh5HQBa26ZM8AZvyHm+r6UP+sVPVa10GLsyd7tD3FqKa1xQ3CstVAOZLO1XZP6YI+KdTXs3jJg9pTB9IvaewZOtCRQscmZpaRyk3TO3pBGXMz0mIM0utGoPGCKoZtJLprhedljIzuw8IsWxT9iQjdh+WIqpOje51nAB8ugU8VfGchUqUEfEins5PJBbXlvbLGiPy9Vxbd46BOhlgRGOg06Hk9rPk2e5bJ4ZuM5a5mZzFoBs0y1G8BBgApkz71KjxHxwAAAABJRU5ErkJggg==');
            background-size:19px;
            background-repeat:no-repeat;
        }

        .mui-icon-extra-people{
            background-image: url('data:image/png;base64,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');
            background-size:19px;
            background-repeat:no-repeat;
        }

        .mui-icon-extra-news{
            background-image: url('data:image/png;base64,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');
            background-size:19px;
            background-repeat:no-repeat;
        }
        .mui-active .mui-icon-extra-class{
            background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFoAAABaCAYAAAA4qEECAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyhpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTM4IDc5LjE1OTgyNCwgMjAxNi8wOS8xNC0wMTowOTowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTcgKE1hY2ludG9zaCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NkI5MDQ3NkEyODkxMTFFN0E4NzVFRTg5MkVFRjFGQ0UiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NkI5MDQ3NkIyODkxMTFFN0E4NzVFRTg5MkVFRjFGQ0UiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpBODJDQ0VGRjI4OTAxMUU3QTg3NUVFODkyRUVGMUZDRSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpBODJDQ0YwMDI4OTAxMUU3QTg3NUVFODkyRUVGMUZDRSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PjQuDCwAAAmDSURBVHja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');

        }
        .mui-active .mui-tab-label{
            color:#da1e38;
        }
        .mui-sou{
            text-align:center;
            width:140px;
            margin:0 auto;
        }
        .mui-sou img{
            width:100%;
            height:100%;
            display:block;
            border:none;
        }

        .box-line {
            position: relative;
        }
        .box-line:before {
            content: " ";
            position: absolute;
            top: 0;
            left: 0;
            width: 200%;
            height: 200%;
            border: 1px solid rgba(207, 207, 207, 0.95);
            border-radius: 5px;
            color: rgba(207, 207, 207, 0.95);
            -webkit-transform-origin: 0 0;
            transform-origin: 0 0;
            -webkit-transform: scale(0.501);
            transform: scale(0.501);
        }
    </style>
</head>


<section class="aui-flexView">
    <header class="aui-navBar aui-navBar-fixed">
        <a href="javascript:;" class="aui-navBar-item">
        </a>
        <div class="aui-center">
            <span class="aui-center-title"></span>
        </div>

    </header>
    <section class="aui-scrollView">
        <div class="aui-panel">
            <a href="javascript:void(0);" class="aui-panel-cell">
                <div class="aui-panel-cell-hd">
                    <img src="../studentAcount/images/user-logo.jpg" alt="">
                </div>
                <div class="aui-panel-cell-bd">
                    <h4>
                        <i>黄凌菲</i>
                        <em>
                            <img src="../studentAcount/images/icon-lv.png" alt="">
                        </em>
                    </h4>
                    <p>
                        <em class="aui-panel-back">我的生日还有x天~</em>
                    </p>
                </div>
                <div class="aui-panel-cell-fr">
                    <p>
                        <i class="icon icon-sign"></i>
                        加入向日葵
                        <em>108天啦</em>
                    </p>
                </div>
            </a>

        </div>
        <div class="aui-card-box">
            <div class="aui-card-list">
                <a href="javascript:void(0);" class="aui-well-item">
                    <div class="aui-well-item-hd">
                        <img src="../studentAcount/images/icon-vip.png" alt="">
                    </div>
                    <div class="aui-well-item-bd">
                        <h3>美术动漫班</h3>
                    </div>
                    <span class="aui-well-item-fr">剩余4课时</span>
                </a>

            </div>
            <div class="aui-card-list">
                <a href="javascript:void(0);" class="aui-well-item">
                    <div class="aui-well-item-hd">
                        <img src="../studentAcount/images/icon-vip.png" alt="">
                    </div>
                    <div class="aui-well-item-bd">
                        <h3>硬笔书法班</h3>
                    </div>
                    <span class="aui-well-item-fr">剩余4课时</span>
                </a>

            </div>

        </div>


        <header class="mui-bar mui-bar-nav aui-header b-line">
            <h1 class="mui-title">学员风采~</h1>
        </header>
        <div class="mui-title-text">
            <p>我们珍惜和记录所有孩子和向日葵在一起的所有时光</p>
        </div>
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide" style="background-image:url(../studentAcount/img/1.jpg)">

                </div>
                <div class="swiper-slide" style="background-image:url(../studentAcount/img/2.jpg)">

                </div>
                <div class="swiper-slide" style="background-image:url(../studentAcount/img/3.jpg)">

                </div>
                <div class="swiper-slide" style="background-image:url(../studentAcount/img/4.jpg)">

                </div>
                <div class="swiper-slide" style="background-image:url(../studentAcount/img/5.jpg)">

                </div>
                <div class="swiper-slide" style="background-image:url(../studentAcount/img/6.jpg)">

                </div>
                <div class="swiper-slide" style="background-image:url(../studentAcount/img/7.jpg)">

                </div>
                <div class="swiper-slide" style="background-image:url(../studentAcount/img/8.jpg)">

                </div>

                <div class="swiper-slide" style="background-image:url(../studentAcount/img/10.jpg)">

                </div>
            </div>
        </div>
    </section>
    <footer class="aui-tabBar aui-tabBar-fixed">
        <!--
            <a href="javascript:;" class="aui-tabBar-item ">
                <span class="aui-tabBar-icon">
                    <i class="icon aui-home"></i>
                </span>
                <span class="aui-tabBar-text">首页</span>
            </a>
            <a href="javascript:;" class="aui-tabBar-item ">
                <span class="aui-tabBar-icon">
                    <i class="icon aui-study"></i>
                </span>
                <span class="aui-tabBar-text">我听</span>
            </a>
            <a href="javascript:;" class="aui-tabBar-item ">
                <span class="aui-tabBar-icon">
                    <i class="icon aui-news"></i>
                </span>
            </a>
            <a href="javascript:;" class="aui-tabBar-item">
                <span class="aui-tabBar-icon">
                    <i class="icon aui-comm"></i>
                </span>
                <span class="aui-tabBar-text">发现</span>
            </a>
            <a href="javascript:;" class="aui-tabBar-item aui-tabBar-active">
                <span class="aui-tabBar-icon">
                    <i class="icon aui-me"></i>
                </span>
                <span class="aui-tabBar-text">我的</span>
            </a>
        -->
    </footer>
</section>


<script src="js/swiper.min.js"></script>
<script type="text/javascript">
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        effect: 'coverflow',
        grabCursor: true,
        centeredSlides: true,
        slidesPerView: 'auto',
        loop: true,
        initialSlide: 6,
        coverflow: {
            rotate: 50,
            stretch: 100,
            depth: 400,
            modifier: 1,
            slideShadows: true
        }
    });
</script>

</body>

</html>
