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
<div class="bar bar-header">
    <h1 class="title">选项卡</h1>
</div>
<ul class="tabs tabs-positive">
    <li class="tab-item active">Chinese</li>
    <li class="tab-item">English</li>
    <li class="tab-item">Japanese</li>
    <li class="tab-item">Russian</li>
</ul>
</body>

</html>

