<ion-view view-title="map">
    <!--本视图可见时，ion-nav-title的内容将被载入导航栏作为标题-->
    <ion-nav-title>
        <img src="../../static/images/test/firefox-logo.png" style="height:100%">
    </ion-nav-title>
    <ion-nav-buttons side="left">
        <button class="button" ng-click="doSomething()">
            Login
        </button>
    </ion-nav-buttons>

    <ion-nav-buttons side="right">
        <button class="button" ng-click="doSomething()">
            register
        </button>
    </ion-nav-buttons>

    <ion-content>
        <!-- The content of the page -->
        <ion-list>
            <ion-item ui-sref="music" class="item-icon-right">
                Go to music page!
                <i class="icon ion-chevron-right"></i>
            </ion-item>
        </ion-list>
    </ion-content>
</ion-view>