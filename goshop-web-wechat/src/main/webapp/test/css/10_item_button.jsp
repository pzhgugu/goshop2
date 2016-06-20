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
    <button class="button icon ion-ios-arrow-left">返回</button>
    <h1 class="title">酒店搜索</h1>
    <button class="button">首页</button>
</div>
<div class="scroll-content has-header">
    <div class="list list-inset">
        <div class="item item-icon-left item-icon-right">
            <i class="icon ion-location"></i>
            <h2>入住城市：当前位置</h2>
            <i class="icon ion-ios-arrow-right"></i>
        </div>
        <div class="item item-icon-left item-icon-right">
            <i class="icon ion-calendar"></i>
            <h2>入住日期：7月27日 星期五</h2>
            <i class="icon ion-ios-arrow-right"></i>
        </div>
        <div class="item item-icon-left item-icon-right">
            <i class="icon ion-social-yen"></i>
            <h2>价格范围：不限价格</h2>
            <i class="icon ion-ios-arrow-right"></i>
        </div>
    </div>
    <div class="padding">
        <button class="button button-block button-assertive">搜索</button>
    </div>
</div>
</body>
</html>

