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
<div class="bar bar-header bar-stable item-input-inset">
    <label class="item-input-wrapper">
        <i class="icon ion-ios-search placeholder-icon"></i>
        <input type="search" placeholder="大家都在搜：七夕">
    </label>
</div>
<div class="tabs tabs-stable tabs-icon-top">
    <a class="tab-item active">
        <i class="icon ion-ios-home-outline"></i>首页
    </a>
    <a class="tab-item">
        <i class="icon ion-ios-email-outline"></i>信息
    </a>
    <a class="tab-item positive-bg light">
        <i class="icon ion-ios-plus-empty"></i>发微博
    </a>
    <a class="tab-item">
        <i class="icon ion-ios-eye-outline"></i>发现
    </a>
    <a class="tab-item">
        <i class="icon ion-ios-person-outline"></i>我
    </a>
</div>
</body>

</html>

