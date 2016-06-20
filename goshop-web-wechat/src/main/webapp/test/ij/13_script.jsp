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
<body ng-controller="firstCtrl">
<script id="map.html" type="text/ng-template">
    <ion-header-bar class="bar-positive">
        <h1 class="title">地图</h1>
        <a ui-sref="novel" class="button">小说</a>
    </ion-header-bar>
    <ion-content padding="true">
        <img src="../../static/images/test/firefox-logo.png">
    </ion-content>
</script>


<script id="novel.html" type="text/ng-template">
    <ion-header-bar class="bar-balanced">
        <h1 class="title">小说</h1>
        <a ui-sref="map" class="button">地图</a>
    </ion-header-bar>
    <ion-content  padding="true">
        <p ng-include="'xiaoshuo.txt'"></p>
    </ion-content>
</script>
<ion-nav-view></ion-nav-view>
</body>
</html>
<script>

    var app = angular.module("myApp", ["ionic"]);
    app.config(function($stateProvider,$urlRouterProvider) {
        $stateProvider
                .state("map", {
                    templateUrl: "map.html"
                })
                .state("novel", {
                    url: "novel",
                    templateUrl: "novel.html"
                });
    })
            .controller("firstCtrl",function($scope,$state){
                $state.go("map");
            });

</script>