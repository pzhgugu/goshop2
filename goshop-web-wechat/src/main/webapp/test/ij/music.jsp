<!--导航框架之模板视图-->
<ion-view view-title="Music">
    <!--本视图可见时，ion-nav-buttons将被导航框架载入导航栏-->
    <ion-nav-buttons side="right">
        <button class="button" ng-click="doSomething()">
            Play
        </button>
    </ion-nav-buttons>
    <ion-content class="padding">
        <!-- The content of the page -->
        <a class="button ion ion-home" ui-sref="map">go map</a>
    </ion-content>
</ion-view>