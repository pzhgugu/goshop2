<%@page language="Java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jstl/core_rt'%>
<c:set var="S_URL" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no,width=device-width,height=device-height">
    <script src="${S_URL}/static/scripts/ionic.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${S_URL}/static/styles/ionic.min.css">
</head>
<body ng-controller="firstCtrl">
<ion-header-bar class="bar-positive">
    <h1 class="title">内联模板</h1>
    <a class="button" ng-click="load()">载入</a>
</ion-header-bar>
<ion-content padding="true" >
    <div id="container"></div>
</ion-content>
<!--模板定义-->
<script id="home.html" type="text/ng-template">
    <p>鲁智深因见山水秀丽，贪行了半日，赶不上宿头，路中又没人作伴，那里投宿是好。又赶了三二十里田地，过了一条板桥，远远地望见一簇红霞，树木丛中，闪着一所庄院。庄后重重叠叠，都是乱山。鲁智深道：“只得投庄上去借宿。”迳奔到庄前看时，见数十个庄家，忙忙急急，搬东搬西。鲁智深到庄前，倚了禅杖，与庄客打个问讯。庄客道：“和尚，日晚来我庄上做甚的？”智深道：“小僧赶不上宿头，欲借贵庄投宿一宵，明早便行。”庄客道：“我庄上今夜有事，歇不得。”智深道：“胡乱借洒家歇一夜，明日便行。”庄客道：“和尚快走，休在这里讨死。”智深道：“也是怪哉！歇一夜打甚么不紧，怎地便是讨死？”庄家道：“去便去，不去时，便捉来缚在这里。”鲁智深大怒道：“你这厮村人，好没道理！俺又不曾说甚的，便要绑缚洒家。”庄家们也有骂的，也有劝的。鲁智深提起禅杖，却待要发作，只见庄里走出一个老人来。但见：主髭须似雪，发鬓如霜。行时腰曲头低，坐后耳聋眼暗。头裹三山暖帽，足穿四缝宽靴。腰间绦系佛头青，身上罗衫鱼肚白。好似山前都土地，正如海底老龙君。</p>
</script>
</body>
</html>
<script>

    angular.module("myApp", ["ionic"])
            .controller("firstCtrl",function($scope,$http,$templateCache){
                $scope.load = function(){
                    $http.get("home.html",{cache:$templateCache})
                            .success(function(data,status){
                                var el = document.querySelector("#container");
                                angular.element(el).html(data);
                            })
                            .error(function(data,status){})
                };

                $scope.load();
            });

</script>