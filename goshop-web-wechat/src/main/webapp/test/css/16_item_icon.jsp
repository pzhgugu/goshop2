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
<div class="bar bar-header bar-assertive">
    <h1 class="title">今日头条 <i class="icon ion-load-c"></i></h1>
    <a class="button button-clear icon ion-person-stalker"></a>
</div>
<div class="scroll-content has-header">
    <div class="list card">
        <a href="#" class="item item-icon-left">
            <i class="icon ion-home"></i>
            Enter home address
        </a>

        <a href="#" class="item item-icon-left">
            <i class="icon ion-ios-telephone"></i>
            Enter phone number
        </a>

        <a href="#" class="item item-icon-left">
            <i class="icon ion-wifi"></i>
            Enter wireless password
        </a>

        <a href="#" class="item item-icon-left">
            <i class="icon ion-card"></i>
            Enter card information
        </a>

    </div>

    <br>
    <div class="card">
        <div class="item item-divider">
            I'm a Header in a Card!
        </div>
        <div class="item item-text-wrap">
            This is a basic Card with some text.
        </div>
        <div class="item item-divider">
            I'm a Footer in a Card!
        </div>
    </div>
</div>
</body>
</html>

