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
    <ul class="list">
        <li class="item">
            <h2>国务院常务会议部署推进公司注册资本登记制度改革</h2>
            <p>中国青年报</p>
        </li>
        <li class="item item-thumbnail-left">
            <img src="${S_URL}/static/images/test/a-1.jpg">
            <h2>大黄鸭在北京两个月创收超两亿元 今日离京</h2>
            <p>中国经营报</p>
        </li>
        <li class="item">
            <h2>LinkedIn创始人：在见风投之前，我希望自己当时懂得这七件事...</h2>
            <p>虎嗅网</p>
        </li>
        <li class="item item-thumbnail-right">
            <img src="${S_URL}/static/images/test/a-2.jpg">
            <h2>美国男子为防妻分家产 将价值50万美元黄金扔垃圾桶</h2>
            <p>新浪新闻</p>
        </li>
    </ul>
</div>
</body>
</html>

