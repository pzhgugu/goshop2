<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8">
    <title>会员中心</title>
    <script type="text/javascript">
        var SITEURL = '${S_URL}';
    </script>
    <link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/styles/shop/base.css">
    <link type="text/css" rel="stylesheet" href="${S_URL}/static/styles/member.css">
    <link type="text/css" rel="stylesheet" href="${S_URL}/static/styles/home_login.css">
    <link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/dialog/dialog.css">
    <link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/jquery-ui/themes/ui-lightness/jquery.ui.css">
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery-browser.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/waypoints.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.validation.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery-ui/jquery.ui.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery-ui/i18n/zh-CN.js"></script>
    <script src="${S_COMMON_URL}/scripts/utils/area_array.js"></script>
    <script src="${S_COMMON_URL}/scripts/shop/common.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.masonry.js"></script>
    <script src="${S_COMMON_URL}/scripts/shop/common_select.js"></script>
    <script src="${S_COMMON_URL}/scripts/qtip/jquery.qtip.min.js"></script>
    <script src="${S_URL}/static/scripts/shop.js"></script>
    <script src="${S_URL}/static/scripts/member.js"></script>
    <script charset="utf-8" id="dialog_js" src="${S_COMMON_URL}/scripts/dialog/dialog.js" type="text/javascript"></script>
    <link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/dialog/dialog.css">
</head>
<body>
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>
<#include "../top.ftl"/>
<#include "../member_header.ftl"/>
<div id="container" class="wrapper">
    <div class="layout">
    <#include "set_sidebar.ftl"/>
        <div class="right-content">

            <div class="path">
                <div><a href="${S_URL}">我的商城</a><span>»</span>
                    <a href="${S_URL}/member/base_set.html">个人资料</a><span>»</span>基本信息</div>
            </div>

            <div class="main">
                <style type="text/css">
                    dl dd span {
                        display: inline-block;
                    }
                </style>

                <div class="wrap">
                <#include "tabmenu.ftl" />

                <@block name="main" ></@block>

                </div><!-- end wrap-->
            </div><!-- end main-->
        </div><!-- end right-content-->
    </div><!-- end container-->
<#include "../footer.ftl"/>
</body>

</html>