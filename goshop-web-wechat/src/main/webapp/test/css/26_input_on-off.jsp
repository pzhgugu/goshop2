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
<div class="bar bar-header bar-positive">
    <button class="button">Edit</button>
    <h1 class="title">Tasks</h1>
    <button class="button icon ion-ios-plus-empty"></button>
</div>
<div class="scroll-content has-header">
    <ul class="list">
        <li class="item item-checkbox item-button-right">
            <label class="checkbox">
                <input type="checkbox">
            </label>
            <h2>Shopping</h2>
            <p>Due tommorow</p>
            <a class="button button-clear icon ion-ios-arrow-right"></a>
        </li>
        <li class="item item-checkbox  item-button-right">
            <label class="checkbox">
                <input type="checkbox" checked>
            </label>
            <h2>Moving house checklist</h2>
            <p>Due tommorow househousehousehouse</p>
            <a class="button button-clear icon ion-ios-arrow-right"></a>
        </li>
        <li class="item item-checkbox  item-button-right">
            <label class="checkbox">
                <input type="checkbox">
            </label>
            <h2>Holiday destinations</h2>
            <a class="button button-clear icon ion-ios-arrow-right"></a>
        </li>
        <li class="item item-checkbox  item-button-right">
            <label class="checkbox">
                <input type="checkbox">
            </label>
            <h2>App ideas</h2>
            <a class="button button-clear icon ion-ios-arrow-right"></a>
        </li>
    </ul>
</div>
<div class="bar bar-footer bar-positive">
    <div class="button-bar">
        <a class="button">All</a>
        <a class="button">Done</a>
        <a class="button">Completed</a>
    </div>
</div>
</body>

</html>

