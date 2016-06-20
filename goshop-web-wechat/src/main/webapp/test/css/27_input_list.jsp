<%@page language="Java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt'%>
<c:set var="S_URL" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no,width=device-width,height=device-height">
    <link rel="stylesheet" type="text/css" href="${S_URL}/static/styles/ionic.min.css">
</head>
<body>
<div class="bar bar-header bar-positive">
    <a class="button icon ion-ios-undo"></a>
    <h1 class="title">订单列表</h1>
</div>
<div class="scroll-content has-header padding">
    <div class="list">
        <div class="item item-divider"><b>请选择支付方式</b></div>
        <label class="item item-radio">
            <input type="radio" name="group">
            <div class="item-content">支付宝客户端支付</div>
            <i class="radio-icon ion-checkmark balanced"></i>
        </label>
        <label class="item item-radio">
            <input type="radio" name="group">
            <div class="item-content">支付宝网页支付</div>
            <i class="radio-icon ion-checkmark balanced"></i>
        </label>
        <label class="item item-radio">
            <input type="radio" name="group" checked>
            <div class="item-content">一键支付（无需支付宝账户）</div>
            <i class="radio-icon ion-checkmark balanced"></i>
        </label>
    </div>
    <button class="button button-block button-positive">立即购买</button>
</div>
</body>

</html>

