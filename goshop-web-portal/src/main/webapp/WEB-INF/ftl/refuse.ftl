<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html><head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>系统信息</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="ShopNC">
    <meta name="copyright" content="ShopNC Inc. All Rights Reserved">
    <link href="${S_COMMON_URL}/styles/shop/base.css" rel="stylesheet" type="text/css">
    <link href="${S_COMMON_URL}/styles/shop/home_header.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="${S_URL}/static/styles/font-awesome/css/font-awesome.min.css">
    <!--[if IE 7]>
    <link rel="stylesheet" href="${S_URL}/static/styles/font-awesome/css/font-awesome-ie7.min.css">
    <![endif]-->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="${S_COMMON_URL}/scripts/utils/html5shiv.js"></script>
    <script src="${S_COMMON_URL}/scripts/utils/respond.js"></script>
    <![endif]-->
    <!--[if IE 6]>
    <script src="${S_COMMON_URL}/scripts/utils/IE6_PNG.js"></script>
    <script>
        DD_belatedPNG.fix('.pngFix');
    </script>
    <script>
        // <![CDATA[
if((window.navigator.appName.toUpperCase().indexOf("MICROSOFT")>=0)&&(document.execCommand))
try{
document.execCommand("BackgroundImageCache", false, true);
   }
catch(e){}
// ]]>
</script>
<![endif]-->
    <style type="text/css">
        body, .header-wrap { background-color: #FAFAFA;}
        .wrapper { width: 1000px;}
        #faq { display: none;}
        .msg { font: 100 36px/48px arial,"microsoft yahei"; color: #555; background-color: #FFF; text-align: center; width: 100%; border: solid 1px #E6E6E6; margin-bottom: 10px; padding: 120px 0;}
        .msg i { font-size: 48px; vertical-align: middle; margin-right: 10px;}
    </style>
    <script>var COOKIE_PRE = '5BF5_';var _CHARSET = 'utf-8';var SITEURL = 'http://localhost/shopnc/shop';var SHOP_RESOURCE_SITE_URL = 'http://localhost/shopnc/shop/resource';var RESOURCE_SITE_URL = 'http://localhost/shopnc/data/resource';var SHOP_TEMPLATES_URL = 'http://localhost/shopnc/shop/templates/default';</script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery-browser.js"></script>
    <script src="${S_COMMON_URL}/scripts/shop/common.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#details").children('ul').children('li').click(function(){
                $(this).parent().children('li').removeClass("current");
                $(this).addClass("current");
                $('#search_act').attr("value",$(this).attr("act"));
            });
            var search_act = $("#details").find("li[class='current']").attr("act");
            $('#search_act').attr("value",search_act);
            $("#keyword").blur();
        });
    </script>
</head>
<body>
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>
<#include "top.ftl"/>
<#include "simple_header.ftl"/>

<div class="msg">
    <i class="icon-ok-sign" style=" color: #27AE61;"></i>
    你还没有登录系统，请<a href="${S_URL}/login.html">登录</a></div>
<script type="text/javascript">
    //window.setTimeout("javascript:location.href='/'", 2000);
</script>

<#include "footer.ftl" />
</body></html>