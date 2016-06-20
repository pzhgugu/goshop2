<%@page language="Java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt'%>
<c:set var="S_URL" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html ng-app>
<head>
    <script src="${S_URL}/static/scripts/angular/angular.min.js"></script>
</head>
<body>
<input ng-model="name" type="text" placeholder="Your name">
<h1>Hello {{name}}</h1>
</body>
</html>
<script>

</script>
