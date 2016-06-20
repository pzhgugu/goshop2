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
<div class="scroll-content padding">
    <div class="list list-borderless">
        <div class="item item-image">
            <img src="${S_URL}/static/images/test/paris.jpg">
        </div>
    </div>
    <div class="list list-inset">
        <label class="item item-input">
            <span class="input-label">Username</span>
            <input type="text" placeholder="joeuser">
        </label>
        <label class="item item-input">
            <span class="input-label">Password</span>
            <input type="password" placeholder="required">
        </label>
    </div>
    <button class="button button-block button-balanced">Sign In</button>
</div>
</body>
</html>

