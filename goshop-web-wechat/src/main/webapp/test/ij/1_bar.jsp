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
<ion-header-bar align-title="center" class="bar-positive">
    <h1 class="title">ion-header-bar</h1>
</ion-header-bar>
<ion-content>
    <ul class="list">
        <li class="item"  ng-repeat="item in items">{{item}}</li>
    </ul>
</ion-content>

<ion-footer-bar align-title="left" class="dark-bg">
    <h1 class="title light">ion-footer-bar</h1>

</ion-footer-bar>
>
</body>
</html>
<script>
    angular.module("myApp",["ionic"])
            .controller("firstCtrl",function($scope){
                $scope.items = [];
                for(var i=0;i<20;i++)
                    $scope.items.push("line " + i);
            })


</script>
