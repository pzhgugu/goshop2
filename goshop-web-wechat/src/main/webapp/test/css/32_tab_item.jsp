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

<body class="stable-bg">
<div class="bar bar-header bar-dark">
    <h1 class="title">微信</h1>
    <a class="button button-clear icon ion-ios-plus-empty"></a>
</div>
<div class="tabs tabs-dark tabs-icon-top">
    <a class="tab-item active">
        <i class="icon ion-ios-chatbubble-outline"></i>微信
    </a>
    <a class="tab-item">
        <i class="icon ion-ios-paper-outline"></i>通信录
    </a>
    <a class="tab-item has-badge active">
        <i class="icon ion-ios-eye-outline"></i>发现
        <i class="badge">12</i>
    </a>
    <a class="tab-item">
        <i class="icon ion-ios-person-outline"></i>我
    </a>
</div>
</body>

</html>

