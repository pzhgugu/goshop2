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
    <style type="text/css">

        .col img{
            width:100%
        }
    </style>
</head>


<body>
<div class="bar bar-header bar-positive">
    <h1 class="title">POPULAR</h1>
    <a class="button icon ion-refresh"></a>
</div>
<div class="scroll-content has-header">
    <div class="row">
        <div class="col"><img src="${S_URL}/static/images/test/a-1.jpg"></div>
        <div class="col"><img src="${S_URL}/static/images/test/a-2.jpg"></div>

    </div>
    <div class="row">
        <div class="col"><img src="${S_URL}/static/images/test/a-4.jpg"></div>
        <div class="col"><img src="${S_URL}/static/images/test/a-3.jpg"></div>
        <div class="col"><img src="${S_URL}/static/images/test/a-2.jpg"></div>
        <div class="col"><img src="${S_URL}/static/images/test/a-1.jpg"></div>
    </div>
    <div class="row">
        <div class="col"><img src="${S_URL}/static/images/test/a-1.jpg"></div>

    </div>
    <div class="row">
        <div class="col"><img src="${S_URL}/static/images/test/a-4.jpg"></div>
        <div class="col"><img src="${S_URL}/static/images/test/a-3.jpg"></div>
        <div class="col"><img src="${S_URL}/static/images/test/a-2.jpg"></div>
        <div class="col"><img src="${S_URL}/static/images/test/a-1.jpg"></div>
    </div>
</div>
<div class="tabs tabs-dark tabs-icon-only">
    <a class="tab-item"><i class="icon ion-home"></i></a>
    <a class="tab-item active"><i class="icon ion-star"></i></a>
    <a class="tab-item"><i class="icon ion-camera"></i></a>
    <a class="tab-item"><i class="icon ion-chatbubble"></i></a>
    <a class="tab-item"><i class="icon ion-document"></i></a>
</div>
</body>

</html>

