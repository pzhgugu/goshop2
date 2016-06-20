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
<div class="scroll-content">
    <div class="list">
        <div class="item item-thumbnail-left item-positive">
            <img src="${S_URL}/static/images/test/firefox-logo.png">
            <h1 class="light">user login</h1>
        </div>
        <label class="item item-input">
            <i class="icon ion-android-person positive"></i>
            <input type="text" placeholder="请输入您的用户名">
        </label>
        <label class="item item-input">
            <i class="icon ion-ios-unlocked-outline positive"></i>
            <input type="password" placeholder="请输入您的密码">
        </label>
        <label class="item item-checkbox">
            <label class="checkbox">
                <input type="checkbox" checked>
            </label>
            记住密码
        </label>
    </div>
    <div class="padding-left padding-right">
        <button class="button button-block button-positive">登录系统</button>
    </div>
</div>
</body>
</html>

