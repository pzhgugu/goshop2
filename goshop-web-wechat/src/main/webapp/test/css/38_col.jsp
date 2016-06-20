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
    <style type="text/css" >

        .col img{

            width: 100%;
        }
    </style>
</head>

<body>
<div class="scroll-content">
    <div class="row">
        <div class="col energized-bg light">

            <img src="${S_URL}/static/images/test/201.jpg" />


        </div>
    </div>
    <div class="row">
        <div class="col col-50  positive-bg light">
            <div>机票</div>

        </div>
        <div class="col col-25  assertive-bg light">
            <img src="${S_URL}/static/images/test/a-2.jpg" />
            <br>
            你好

        </div>
        <div class="col col-25  calm-bg light">
            <div>用车</div>

        </div>
    </div>

    <div class="row">
        <div class="col  calm-bg light">
            <div>酒店</div>

        </div>
        <div class="col stable-bg energized" >

            <div>我的携程</div>
        </div>
    </div>

    <div class="row">
        <div class="col  balanced-bg light">
            <div>旅游</div>

        </div>
        <div class="col energized-bg light">
            <div>景点门票</div>

        </div>
        <div class="col  royal-bg light">
            <div>攻略社区</div>

        </div>
    </div>

</div>
</body>
</html>

