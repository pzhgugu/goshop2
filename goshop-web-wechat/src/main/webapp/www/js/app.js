
angular.module('ionicApp', ['ionic','starter.controllers','starter.config','starter.services','ngResource'])
    .run(['$rootScope',function ($rootScope) {
            $rootScope.S_URL=S_URL;
        }        
    ])

    .config(function($stateProvider, $urlRouterProvider,$ionicConfigProvider) {
        $ionicConfigProvider.platform.ios.tabs.style('standard');
        $ionicConfigProvider.platform.ios.tabs.position('bottom');
        $ionicConfigProvider.platform.android.tabs.style('standard');
        $ionicConfigProvider.platform.android.tabs.position('standard');

        $ionicConfigProvider.platform.ios.navBar.alignTitle('center');
        $ionicConfigProvider.platform.android.navBar.alignTitle('left');

        $ionicConfigProvider.platform.ios.backButton.previousTitleText('').icon('ion-ios-arrow-thin-left');
        $ionicConfigProvider.platform.android.backButton.previousTitleText('').icon('ion-android-arrow-back');

        $ionicConfigProvider.platform.ios.views.transition('ios');
        $ionicConfigProvider.platform.android.views.transition('android');

      $stateProvider
            .state('tab', {
                url: '/tab',
                abstract: true,
                templateUrl: 'templates/tabs.html'
            })

            // Each tab has its own nav history stack:

         .state('tab.new', {
                url: '/new',
                views: {
                    'tab-new': {
                        templateUrl: 'templates/news/news.html',
                        controller: 'PortalCtrl'
                    }
                }
            })
          .state('tab.news_content', {
              url: "/news_content/:aid",
              views: {
                  'tab-new': {
                      templateUrl: 'templates/news/news-content.html',
                      controller: 'NewsContentCtrl'
                  }
              }
          })
          .state('tab.hot', {
              url: '/hot',
              views: {
                  'tab-hot': {
                      templateUrl: 'templates/hot/tab-hot.html'
                  }
              }
          })
          .state('tab.user', {
              url: '/user',
              views: {
                  'tab-user': {
                      templateUrl: 'templates/user/tab-user.html'
                  }
              }
          })

          .state('tab.audio', {
              url: '/audio',
              views: {
                  'tab-audio': {
                      templateUrl: 'templates/audio/tab-audio.html'
                  }
              }
          })
       $urlRouterProvider.otherwise('/tab/new');

    });
