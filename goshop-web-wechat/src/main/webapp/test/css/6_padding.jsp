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
<div class="bar bar-header bar-positive">
    <h1 class="title">Padding</h1>
</div>
<div class="scroll-content has-header padding">
    <div class="padding-top"><div class="calm-bg light">.padding-top</p></div>
        <div class="padding-bottom"><div class="assertive-bg light">.padding-bottom</div></div>
        <div class="padding-left"><div class="energized-bg light">.padding-left</div></div>
        <div class="padding-right"><div class="royal-bg light">.padding-right</div></div>
    </div>
</body>
</html>

