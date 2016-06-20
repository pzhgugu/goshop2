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

<body class="dark-bg">
<div class="tabs-striped tabs-top tabs-dark tabs-icon-only">
    <div class="tabs">
        <a class="tab-item active">
            <i class="icon ion-ios-telephone"></i>
        </a>
        <a class="tab-item">
            <i class="icon ion-ios-clock"></i>
        </a>
        <a class="tab-item">
            <i class="icon ion-ios-person"></i>
        </a>
    </div>
</div>
<div class="tabs tabs-dark tabs-icon-only">
    <a class="tab-item">
        <i class="icon ion-ios-search"></i>
    </a>
    <a class="tab-item active">
        <i class="icon ion-ios-telephone"></i>
    </a>
    <a class="tab-item" href="#">
        <i class="icon ion-backspace"></i>
    </a>
</div>
</body>
</html>

