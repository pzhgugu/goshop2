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
<ion-nav-bar class="bar-positive">
    <ion-nav-back-button></ion-nav-back-button>
</ion-nav-bar>
<!---<div ui-view></div>-->
<ion-nav-view></ion-nav-view>


</body>
<script type="text/javascript">
    var app = angular.module("myApp", ["ionic"]);

    app.config(function($stateProvider) {
        $stateProvider
                .state("map", {
                    templateUrl: "map.jsp"
                })
                .state("music", {
                    templateUrl: "music.jsp"
                }) ;


    }).controller('firstCtrl',function($scope,$state){

        $state.go('map');

    })



</script>


</html>
