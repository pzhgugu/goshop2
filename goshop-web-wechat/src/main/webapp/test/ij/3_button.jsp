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
<ion-header-bar class="bar-dark">
    <a class="button button-clear icon ion-cloud"></a>
    <h1 class="title">Hey Jude / The Beatles</h1>
    <a class="button button-clear icon ion-navicon"></a>
</ion-header-bar>
<ion-content>
    <ul class="list card">
        <li class="item item-image">
            <img src="../../static/images/test/bmw.jpg">
        </li>
    </ul>
</ion-content>
<ion-footer-bar class="bar-dark">
    <div class="button-bar">
        <a class="button button-clear icon ion-ios-loop"></a>
        <a class="button button-clear icon ion-ios-skipbackward"></a>
        <a class="button button-clear icon ion-ios-skipforward"></a>
        <a class="button button-clear icon ion-ios-pause"></a>
        <a class="button button-clear icon ion-ios-volume-high"></a>
    </div>
</ion-footer-bar>
</body>
</html>
