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
<!--视图容器-->
<div ui-view></div>
<!--内联模板: home.html-->
<script id="home.html" type="text/ng-template">
    <div class="bar bar-header bar-positive">
        <h1 class="title">home</h1>
    </div>
    <div class="scroll-content has-header">
        <ul class="list list-inset">
            <li class="item item-icon-right" ui-sref="music">
                Go Music!
                <i class="icon ion-ios-arrow-right"></i>
            </li>
            <li class="item item-icon-right" ui-sref="sport">
                Go Sport!
                <i class="icon ion-ios-arrow-right"></i>
            </li>
        </ul>
    </div>
</script>
<!--内联模板: music.html-->
<script id="music.html" type="text/ng-template">
    <div class="bar bar-header bar-energized">
        <h1 class="title">music</h1>
    </div>
    <div class="scroll-content has-header">
        <ul class="list list-inset">
            <li class="item item-icon-right" ui-sref="home">
                Go Home!
                <i class="icon ion-ios-arrow-right"></i>
            </li>
            <li class="item item-icon-right" ui-sref="sport">
                Go Sport!
                <i class="icon ion-ios-arrow-right"></i>
            </li>
        </ul>
    </div>
</script>
</body>
</html>
<script>

    angular.module("myApp", ["ionic"])
            .config(function($stateProvider,$urlRouterProvider) {
                //配置状态机
                $stateProvider
                        .state("home", {
                            templateUrl: "home.html"	//内联模板的id
                        })
                        .state("music", {
                            templateUrl: "music.html"	//内联模板的id
                        });
            })
            .controller("firstCtrl",function($scope,$state){
                //切换到状态 : home
                $state.go("home");
            });


</script>