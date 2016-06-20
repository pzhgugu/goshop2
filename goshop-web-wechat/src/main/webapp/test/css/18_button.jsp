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
    <h1 class="title">图标按钮</h1>
</div>
<div class="scroll-content has-header">
    <button class="button">
        <i class="icon ion-loading-c"></i> Loading...
    </button>
    <button class="button icon-left ion-home">Home</button>
    <button class="button icon-left ion-star button-positive">Favorites</button>
    <a class="button icon-right ion-chevron-right button-calm">Learn More</a>
    <a class="button icon-left ion-chevron-left button-clear button-dark">Back</a>
    <button class="button icon ion-gear-a"></button>
    <a class="button button-icon icon ion-settings"></a>
    <a class="button button-outline icon-right ion-navicon button-balanced">Reorder</a>
</div>
</body>
</html>

