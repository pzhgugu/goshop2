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
<ion-header-bar class="bar-positive">
    <h1 class="title">$ionicScrollDelegate</h1>
</ion-header-bar>
<ion-content>
    <ul class="list">
        <li class="item"  ng-repeat="item in items">{{item}}</li>
    </ul>
</ion-content>
<ion-footer-bar class="bar-positive">
    <a class="button" ng-click="gotop();">GO TOP!</a>
    <a class="button" ng-click="gobottom();">GO BOTTOM!</a>

    <a class="button" ng-click="getScrollPosition();">ScrollPosition</a>
</ion-footer-bar>
</body>
</html>
<script>
    angular.module("myApp",["ionic"])
            .controller("firstCtrl",["$scope","$ionicScrollDelegate",function($scope,$ionicScollDelegate){
                $scope.items = [];
                for(var i=0;i<100;i++)
                    $scope.items.push(["item ",i+1].join(""));
                $scope.gotop = function(){
                    $ionicScollDelegate.scrollTop(true);
                }
                $scope.gobottom = function(){
                    $ionicScollDelegate.scrollBottom(true);
                }

                $scope.getScrollPosition = function(){
                    console.log($ionicScollDelegate.getScrollPosition());

                }



            }]);
</script>