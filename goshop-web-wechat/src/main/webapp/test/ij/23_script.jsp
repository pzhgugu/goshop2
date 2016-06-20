<%@page language="Java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt'%>
<c:set var="S_URL" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no,width=device-width,height=device-height">
    <script src="${S_URL}/static/scripts/ionic.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${S_URL}/static/styles/ionic.min.css">
</head>
<body ng-controller="ezCtrl">
<!--导航框架之导航栏-->
<ion-nav-bar class="bar-positive">
    <ion-nav-back-button></ion-nav-back-button>
</ion-nav-bar>
<!--导航框架之导航视图-->
<ion-nav-view></ion-nav-view>
<script id="home.html" type="text/ng-template">
    <!--导航框架之模板视图-->
    <ion-view view-title="Home">
        <ion-content>
            <ion-list>
                <ion-item ui-sref="music" class="item-icon-right">
                    Go to music page!
                    <i class="icon ion-chevron-right"></i>
                </ion-item>
                <ion-item class="item-divider">$ionicHistory</ion-item>
                <ion-item ng-click="show_history($event)">viewHistory()</ion-item>
                <ion-toggle ng-model="flag.disableAnimate">nextViewOptions()</ion-toggle>
            </ion-list>
        </ion-content>
    </ion-view>
</script>
<script id="music.html" type="text/ng-template">
    <!--导航框架之模板视图-->
    <ion-view view-title="Music">
        <ion-content class="padding">
            <a class="button ion ion-home" ui-sref="home">go home</a>
        </ion-content>
    </ion-view>
</script>
</body>
</html>
