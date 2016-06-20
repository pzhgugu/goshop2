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
    <h1 class="title">按钮</h1>
</div>
<div class="scroll-content has-header padding">
    <button class="button">Default</button>
    <button class="button button-calm button-block">button-light</button>
    <button class="button button-stable">button-stable</button>
    <button class="button button-positive">button-positive</button>
    <button class="button button-calm">button-calm</button>
    <button class="button button-balanced">button-balanced</button>
    <button class="button button-energized">button-energized</button>
    <button class="button button-assertive">button-assertive</button>
    <button class="button button-royal">button-royal</button>
    <button class="button button-dark">button-dark</button>
</div>
</body>
</html>

