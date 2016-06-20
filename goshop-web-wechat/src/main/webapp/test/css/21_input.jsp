<%@page language="Java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt'%>
<c:set var="S_URL" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no,width=device-width,height=device-height">
    <link rel="stylesheet" type="text/css" href="${S_URL}/static/styles/ionic.min.css">
</head>
<body>
<div class="bar bar-header bar-balanced">
    <h1 class="title">表单输入</h1>
</div>
<div class="scroll-content has-header padding">
    <div class="list">
        <label class="item item-input">
            <input type="text" placeholder="First Name">
        </label>
        <label class="item item-input">
            <input type="text" placeholder="Last Name">
        </label>
        <label class="item item-input">
            <textarea placeholder="Comments"></textarea>
        </label>
    </div>
</div>
</body>
</html>

