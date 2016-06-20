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
<body class="stable">
<div class="bar bar-header">
    <h1 class="title">列表中使用按钮</h1>
</div>
<div class="scroll-content has-header">
    <ul class="list">
        <li class="item item-button-right">
            <h2>新闻</h2>
            <a class="button button-clear icon ion-ios-arrow-right"></a>
        </li>
        <li class="item item-button-right">
            <h2>邮件</h2>
            <a class="button button-clear icon ion-ios-email"></a>
        </li>
        <li class="item item-button-right">
            <h2>电话</h2>
            <a class="button button-clear icon ion-ios-telephone"></a>
        </li>
        <li class="item item-button-right">
            <h2>设置</h2>
            <a class="button button-clear icon ion-ios-gear"></a>
        </li>
        <li class="item item-button-right">
            <h2>云服务</h2>
            <a class="button button-clear icon ion-ios-cloud"></a>
        </li>
        <li class="item item-button-right">
            <h2>在线帮助</h2>
            <a class="button button-clear icon ion-ios-help"></a>
        </li>
    </ul>
</div>
</body>
</html>

