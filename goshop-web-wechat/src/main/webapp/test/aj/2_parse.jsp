<%@page language="Java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt'%>
<c:set var="S_URL" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
    <script src="${S_URL}/static/scripts/angular/angular.min.js"></script>
</head>
<body>
<div ng-controller="MyController">
<input ng-model="expr" type="text" placeholder="Enter na expression">
<h1>Hello {{parsendValue}}</h1>
</div>
</body>
</html>
<script>
angular.module("myApp",[]).controller("NyController",
    function ($scope,$parse) {
        $scope.$watch('expr',function (newVal,oldVal,scope) {
            if(newVal != oldVal){
                var parseFun =$parse('expr');
                $scope.parsedValue=parseFun(scope);
            }
        });
    }
);
</script>
