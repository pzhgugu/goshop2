<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <script type="application/javascript" >
        var S_URL='${S_URL}';
    </script>
    <script src="${S_URL}/static/scripts/lib/js/ionic.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${S_URL}/static/scripts/lib/css/ionic.min.css">
    <script src="${S_URL}/static/scripts/index.app.js"></script>
</head>
<body ng-app="myApp">

<ion-nav-bar class="bar-stable">
    <ion-nav-back-button>
    </ion-nav-back-button>
</ion-nav-bar>

<ion-nav-view></ion-nav-view>
</body>
</html>
