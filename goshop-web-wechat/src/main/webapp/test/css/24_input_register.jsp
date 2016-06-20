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
        <div class="item item-assertive item-button-right">
            <h1 class="light">注册</h1>
        </div>
        <label class="item item-input item-stacked-label">
            <span class="input-label">Email</span>
            <input type="text" placeholder="me@vucek.com">
        </label>
        <label class="item item-input item-stacked-label">
            <span class="input-label">Password</span>
            <input type="password" placeholder="********">
        </label>
    </div>
    <div class="padding-left padding-right">
        <button class="button button-block button-stable">Log in</button>
    </div>
</div>
</body>
</html>

