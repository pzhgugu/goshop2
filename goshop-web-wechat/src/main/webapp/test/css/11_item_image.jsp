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
    <h1 class="title">Header</h1>
    <button class="button icon ion-plus"></button>
</div>
<div class="scroll-content has-header">
    <div class="list">
        <div class="item item-avatar-right">
            <img src="${S_URL}/static/images/test/a-1.jpg">

            <h2>Thomasguy</h2>
            <p>真的好好吃啊...</p>


        </div>
        <div class="item item-avatar">
            <img src="${S_URL}/static/images/test/a-2.jpg">
            <h2>Ray</h2>
            <p>真的好好吃啊...</p>

        </div>
        <div class="item item-avatar">
            <img src="${S_URL}/static/images/test/a-3.jpg">
            <h2>Egon</h2>
            <p>什么时候去看演唱会啊，...</p>
        </div>
        <div class="item item-avatar">
            <img src="${S_URL}/static/images/test/a-4.jpg">
            <h2>Winston</h2>
            <p>I love this game!</p>
        </div>
    </div>
</div>
<div class="bar bar-footer bar-dark">
    <div class="button-bar">
        <a class="button button-clear icon ion-ios-chatbubble-outline">Chat</a>
        <a class="button button-clear icon ion-ios-list-outline">Address</a>
        <a class="button button-clear icon ion-ios-eye-outline">Discovery</a>
        <a class="button button-clear icon ion-ios-person-outline">Profile</a>
    </div>
</div>
</body>
</html>

