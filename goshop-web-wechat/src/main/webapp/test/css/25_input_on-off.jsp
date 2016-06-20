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
    <h1 class="title">信息</h1>
</div>
<div class="scroll-content has-header">
    <ul class="list">
        <li class="item item-toggle">
            iMessage
            <label class="toggle toggle-balanced">
                <input type="checkbox">
                <div class="track">
                    <div class="handle"></div>
                </div>
            </label>
        </li>
        <li class="item item-divider">短信/彩信</li>
        <li class="item item-toggle">
            字符计数
            <label class="toggle toggle-balanced">
                <input type="checkbox" checked>
                <div class="track">
                    <div class="handle"></div>
                </div>
            </label>
        </li>
        <li class="item item-toggle item-button-right">
            黑名单
            <a class="button button-clear icon ion-ios-arrow-right"></a>
        </li>
    </ul>
</div>
</body>

</html>

