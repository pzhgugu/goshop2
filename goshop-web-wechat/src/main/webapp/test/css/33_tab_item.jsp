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
<div class="bar bar-header bar-dark">
    <h1 class="title">微信</h1>
    <a class="button button-clear icon ion-ios-plus-empty"></a>
</div>
<div class="tabs tabs-top tabs-stable">
    <a class="tab-item">要闻</a>
    <a class="tab-item active">河南</a>
    <a class="tab-item">房产</a>
    <a class="tab-item">财经</a>
    <a class="tab-item">娱乐</a>
</div>
<div class="content stable-bg">
</div>
<div class="tabs tabs-stable tabs-icon-top">
    <a class="tab-item active">
        <i class="icon ion-ios-paper-outline"></i>新闻
    </a>
    <a class="tab-item">
        <i class="icon ion-ios-book-outline"></i>订阅
    </a>
    <a class="tab-item has-badge">
        <div class="badge badge-positive">12</div>
        <i class="icon ion-images"></i>图片
    </a>
    <a class="tab-item">
        <i class="icon ion-ios-videocam-outline"></i>视频
    </a>
</div>
</body>
</html>

