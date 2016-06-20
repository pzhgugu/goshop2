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
<div class="bar bar-header bar-stable">
    <button class="button button-clear button-positive icon ion-ios-arrow-left">设置</button>
    <h1 class="title">声音</h1>
</div>
<div class="scroll-content has-header">
    <div class="list">
        <div class="item item-divider">铃声和提醒</div>
        <div class="item range range-positive">
            <i class="icon ion-ios-volume-low"></i>
            <input type="range" name="volume" value=30>
            <i class="icon ion-ios-volume-high"></i>
        </div>
        <div class="item item-toggle">
            用按钮调整
            <label class="toggle toggle-balanced">
                <input type="checkbox" checked>
                <div class="track">
                    <div class="handle"></div>
                </div>
            </label>
        </div>
    </div>
</div>
</body>

</html>

