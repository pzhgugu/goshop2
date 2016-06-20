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
<div class="bar bar-header">
    <h1 class="title">指定列宽</h1>
</div>
<div class="scroll-content has-header">
    <div class="row">
        <div class="col col-50 positive-bg">.col.col-50  宽度50%</div>
        <div class="col dark-bg">.col  25%</div>
        <div class="col">.col 25%</div>
    </div>

    <div class="row">
        <div class="col col-75">.col.col-75</div>
        <div class="col positive-bg">.col</div>
    </div>

    <div class="row">
        <div class="col">.col</div>
        <div class="col col-75">.col.col-75</div>
    </div>

    <div class="row">
        <div class="col">.col</div>
        <div class="col">.col</div>
    </div>

</div>
</body>
</html>

