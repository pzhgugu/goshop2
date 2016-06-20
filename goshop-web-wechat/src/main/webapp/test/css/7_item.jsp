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
<body class="stable">
<div class="bar bar-header bar-balanced">
    <h1 class="title">列表</h1>
</div>
<div class="scroll-content has-header">
    <ul class="list">
        <li class="item">phonegap</li>
        <li class="item">php</li>
        <li class="item">android</li>
        <li class="item">Mega Man</li>
        <li class="item">Metroid</li>
        <li class="item">Mike Tyson's Punch-Out</li>
    </ul>
</div>
</body>
</html>

