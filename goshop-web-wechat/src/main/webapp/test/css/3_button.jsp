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
<div class="bar bar-header item-input-inset">

    <label class="item-input-wrapper">
        <a class="button button-clear icon-right ion-android-arrow-dropdown">北京</a>
        <input type="text" placeholder="输入您要搜索的内容">

    </label>

</div>


<div class="scroll-content has-header">
    内容
</div>

<div class="bar bar-footer bar-light">

    <div class="button-bar">
        <a class="button button-clear icon ion-images">新闻</a>
        <a class="button button-clear">国内</a>
        <a class="button button-clear">国际</a>
        <a class="button button-clear">体育</a>
        <a class="button button-clear">科技</a>
    </div>
</div>
</body>
</html>

