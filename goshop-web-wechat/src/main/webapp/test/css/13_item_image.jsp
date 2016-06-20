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
    <h1 class="title">Instagram</h1>
    <a class="button button-clear icon ion-refresh"></a>
</div>
<div class="scroll-content has-header">
    <div class="list">
        <div class="item item-avatar-left">
            <img src="${S_URL}/static/images/test/a-1.jpg">
            <h2>Thomasguy</h2>
        </div>
        <div class="item item-image">
            <img src="${S_URL}/static/images/test/bmw.jpg">
        </div>
        <div class="item item-icon-left">
            <i class="icon ion-thumbsup"></i>
            <p>44 likes</p>
        </div>
    </div>
</div>
</body>
</html>

