<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta charset="utf-8">
        <title>商家入驻</title>
        <link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/styles/shop/base.css">
        <link type="text/css" rel="stylesheet" href="${S_URL}/static/styles/store_joinin.css">
        <link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/dialog/dialog.css">
        <link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/jquery-ui/themes/ui-lightness/jquery.ui.css">
        <script src="${S_COMMON_URL}/scripts/jquery/jquery.js"></script>
        <script src="${S_COMMON_URL}/scripts/jquery/jquery-browser.js"></script>
        <script src="${S_COMMON_URL}/scripts/jquery/waypoints.js"></script>
        <script src="${S_COMMON_URL}/scripts/jquery/jquery.validation.js"></script>
        <script src="${S_COMMON_URL}/scripts/jquery-ui/jquery.ui.js"></script>
        <script src="${S_COMMON_URL}/scripts/utils/area_array.js"></script>
        <script src="${S_COMMON_URL}/scripts/shop/common.js"></script>
    </head>


    <body>
    <#include "header.ftl"/>

    <div class="container wrapper">
        <#include "sidebar.ftl"/>
        <div class="main">
            <#if P_STORE_JOIN.joininState=='10'>
                <div class="explain"><i></i>入驻申请已经提交，请等待管理员审核</div>
                <div class="bottom"></div>
            </#if>
            <#if P_STORE_JOIN.joininState=='11'>
                <div class="explain"><i></i>已经提交，请等待管理员核对后为您开通店铺</div>
                <div class="bottom"></div>
            </#if>
            <#if P_STORE_JOIN.joininState=='30'>
                <div class="explain"><i></i>审核失败:${P_STORE_JOIN.joininMessage}</div>
                <div class="bottom">
                    <a class="btn" href="${S_URL}/store_join/step1.html">下一步</a>
                </div>
            </#if>

            <#if P_STORE_JOIN.joininState=='20'>
                <div class="explain"><i></i>审核成功，请完成付款，付款后点击下一步提交付款凭证</div>
                <div class="bottom">
                    <a class="btn" href="${S_URL}/store_join/pay.html">下一步</a>
                </div>
            </#if>


            <#if P_STORE_JOIN.joininState=='31'>
                <div class="explain"><i></i>付款审核失败:${P_STORE_JOIN.joininMessage}</div>
                <div class="bottom">
                    <a class="btn" href="${S_URL}/store_join/pay.html">下一步</a>
                </div>
            </#if>

        </div>
    </div>


        <#include "../button.ftl"/>
        <#include "../footer.ftl"/>
    </body>
</html>