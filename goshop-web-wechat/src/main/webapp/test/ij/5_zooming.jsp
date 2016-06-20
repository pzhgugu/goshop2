<%@page language="Java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt'%>
<c:set var="S_URL" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html ng-app="ionic">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no,width=device-width,height=device-height">
    <script src="${S_URL}/static/scripts/ionic.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${S_URL}/static/styles/ionic.min.css">
</head>
<body>
<ion-header-bar class="bar-positive">
    <h1 class="title">ion-scroll</h1>
</ion-header-bar>
<ion-scroll class="has-header" zooming="true" direction="xy" style="width: 500px; height: 500px">
    <div style="width: 5000px; height: 5000px; background: url('../../static/images/test/map.jpg') repeat"></div>
</ion-scroll>
</body>
</html>
