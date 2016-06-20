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
<body ng-controller="myCtrl">
<!--导航框架之导航栏-->
<ion-nav-bar align-title="center" class="bar-positive">
    <ion-nav-back-button></ion-nav-back-button>
</ion-nav-bar>
<!--导航框架之导航视图-->
<ion-nav-view></ion-nav-view>
<script id="home.html" type="text/ng-template">
    <!--导航框架之模板视图-->
    <ion-view view-title="Home">
        <ion-content>
            <ion-list type="card">
                <ion-item ui-sref="music" class="item-icon-right">
                    音乐
                    <i class="icon ion-ios-arrow-right"></i>
                </ion-item>
                <ion-item ui-sref="novel" class="item-icon-right">
                    小说
                    <i class="icon ion-ios-arrow-right"></i>
                </ion-item>
            </ion-list>
        </ion-content>
    </ion-view>
</script>
<script id="music.html" type="text/ng-template">
    <!-- ion-view 的title 属性值将显示在导航栏中 -->
    <ion-view view-title="Music">
        <ion-content class="padding">
            <a class="button ion ion-home" ui-sref="home">go home</a>
        </ion-content>
    </ion-view>
</script>
<script id="novel.html" type="text/ng-template">
    <ion-view title="Novel">
        <ion-content>
            <p ng-include="'txt/xiyouji.txt'"></p>
        </ion-content>
    </ion-view>
</script>
</body>
</html>
<script>
    var app = angular.module("myApp", ["ionic"]);
    app.config(function($stateProvider,$urlRouterProvider) {
        $stateProvider
                .state("home", {
                    templateUrl: "home.html"
                })
                .state("music", {
                    templateUrl: "music.html"
                })
                .state("novel", {
                    templateUrl: "novel.html"
                });
    })
            .controller("myCtrl",function($scope,$state){
                $state.go("home");
            });


</script>
