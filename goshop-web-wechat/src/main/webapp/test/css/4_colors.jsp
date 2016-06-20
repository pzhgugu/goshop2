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
    <h1 class="title">Colors</h1>
</div>
<div class="scroll-content has-header">
    <div class="balanced-bg light">bg:balanced fg:light</div>
    <div class="energized-bg balanced">bg:energized fg:balanced</div>
    <div class="dark-bg stable">bg:dark fg:stable</div>
    <div class="assertive-bg royal">bg:assertive fg:royal</div>
</div>
</body>
</html>

