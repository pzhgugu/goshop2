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
    <h1 class="title">ion-content</h1>
</ion-header-bar>
<ion-content>
    <ul class="list">
        <li  class="item" ng-repeat="item in items">{{item}}</li>
    </ul>
</ion-content>
</body>
</html>
<script>
    angular.module("myApp",["ionic"])
            .controller("firstCtrl",function($scope){
                $scope.items=[];
                for(var i=0;i<50;i++)
                    $scope.items.push(["this is line ",i].join(""));
            });

</script>
