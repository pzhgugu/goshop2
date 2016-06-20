<%@page language="Java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt'%>
<c:set var="S_URL" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html ng-app="ionic">
<head>
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no,width=device-width,height=device-height">
    <script src="${S_URL}/static/scripts/ionic.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${S_URL}/static/styles/ionic.min.css">
</head>
<body>
<ion-header-bar class="bar-positive">
    <h1 class="title">ion-tabs</h1>
</ion-header-bar>
<ion-tabs>
    <ion-tab title="tab1">
        <ion-view>
            <ion-content class="calm-bg">
                tab 1 content
            </ion-content>
        </ion-view>
    </ion-tab>
    <ion-tab title="tab2">
        <ion-view>
            <ion-content class="balanced-bg">
                tab 2 content
            </ion-content>
        </ion-view>
    </ion-tab>
    <ion-tab title="tab3">
        <ion-view>
            <ion-content class="energized-bg">
                tab 3 content
            </ion-content>
        </ion-view>
    </ion-tab>

</ion-tabs>
</body>
</html>