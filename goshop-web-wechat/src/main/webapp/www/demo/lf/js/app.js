angular.module('ionicApp', ['ionic','starter.controllers','starter.services','starter.config','ngResource','starter.directive'])

    .run([ '$rootScope', '$state', '$stateParams','$ionicPlatform','Storage','jpushService', function ($rootScope,$state,$stateParams,$ionicPlatform,Storage,jpushService) {

                // It's very handy to add references to $state and $stateParams to the $rootScope
                // so that you can access them from any scope within your applications.For example,
                // <li ng-class="{ active: $state.includes('contacts.list') }"> will set the <li>
                // to active whenever 'contacts.list' or one of its decendents is active.
                $ionicPlatform.ready(function() {
                    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
                    // for form inputs)
                  //  $state.go('tabs.news_content',{aid:3413});
                  if(window.cordova && window.cordova.plugins.Keyboard) {
                     cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
                  }
                  if(window.StatusBar) {
                  // org.apache.cordova.statusbar required
                     StatusBar.styleDefault();
                  }


                //推送初始化
                var setTagsWithAliasCallback=function(event){
                    window.alert('result code:'+event.resultCode+' tags:'+event.tags+' alias:'+event.alias);
                }
                var openNotificationInAndroidCallback=function(data){
                    var json=data;
                   // window.alert(json);
                    if(typeof data === 'string'){
                        json=JSON.parse(data);
                    }
                    var id=json.extras['cn.jpush.android.EXTRA'].id;

                    $state.go('tabs.news_content',{aid:id});

                   // $state.go('tab.reporter_content',{id:id});
                }
                var config={
                    stac:setTagsWithAliasCallback,
                    oniac:openNotificationInAndroidCallback
                };

                jpushService.init(config);
               // window.alert('执行启动');
                //启动极光推送服务
                //window.plugins.jPushPlugin.init();
                //window.plugins.jPushPlugin.setDebugMode(true);



                  //  $rootScope.$state = $state;
                  //  $rootScope.$stateParams = $stateParams;
                   // console.log($stateParams);

                    document.addEventListener("deviceready",  function onDeviceReady() {
                       // console.log('设备id：'+device.uuid);
                        Storage.set('device_id',device.uuid);
                    }, false);

                });

            }
        ]
    )

    .config(['$stateProvider','$urlRouterProvider','$ionicConfigProvider',function($stateProvider, $urlRouterProvider,$ionicConfigProvider) {

        $ionicConfigProvider.platform.ios.tabs.style('standard');
        $ionicConfigProvider.platform.ios.tabs.position('bottom');
        $ionicConfigProvider.platform.android.tabs.style('standard');
        $ionicConfigProvider.platform.android.tabs.position('standard');

        $ionicConfigProvider.platform.ios.navBar.alignTitle('left');
        $ionicConfigProvider.platform.android.navBar.alignTitle('left');

      /*
      *   $ionicConfigProvider.platform.ios.backButton.previousTitleText('').icon('ion-ios-arrow-thin-left');
       $ionicConfigProvider.platform.android.backButton.previousTitleText('').icon('ion-android-arrow-back');
      * */
        $ionicConfigProvider.platform.ios.backButton.previousTitleText('').icon('ion-ios-arrow-thin-left');
         $ionicConfigProvider.platform.ios.views.transition('ios');
        $ionicConfigProvider.platform.android.views.transition('none');

        $ionicConfigProvider.backButton.previousTitleText(false);


    //    $httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';
     //   $httpProvider.defaults.headers.put['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

        $stateProvider
            .state('tabs', {
                url: "/tab",
                abstract: true,
                templateUrl: "templates/tabs.html"
            })
            //视频
            .state('tabs.video', {
                url: "/video",
                views: {
                    'video-tab': {
                        templateUrl: "templates/video/index.html",
                        controller: 'VideoCtrl'
                    }
                }
            })

            .state('tabs.video_content', {
                url: "/video_content/:id",
                views: {
                    'video-tab': {
                        templateUrl: 'templates/video/video-content.html',
                        controller: 'VideoContentCtrl'
                    }
                }
            })

            //新闻
            .state('tabs.news', {
                url: "/news",
                views: {
                    'news-tab': {
                        templateUrl: "templates/news/news.html",
                        controller: 'PortalCtrl'


                    }
                }
            })
            .state('tabs.news_content', {
                url: "/news_content/:aid",
                views: {
                    'news-tab': {
                        templateUrl: 'templates/news/news-content.html',
                        controller: 'NewsContentCtrl'
                    }
                }
            })
            .state('tabs.search', {
                url: "/search",
                views: {
                    'news-tab': {
                        templateUrl: 'templates/news/search.html',
                        controller: 'SearchContentCtrl'
                    }
                }
            })

            .state('tabs.collect', {
                url: "/collect",
                views: {
                    'news-tab': {
                        templateUrl: 'templates/news/collect.html',
                        controller: 'CollectContentCtrl'
                    }
                }
            })






            //社会
            .state('tabs.world', {
                url: "/world",
                views: {
                    'world-tab': {
                        templateUrl: "templates/world/index.html",
                        controller: 'WorldListCtrl'
                    }
                }
            })
            .state('tabs.world_content', {
                url: "/world_content/:aid",
                views: {
                    'world-tab': {
                        templateUrl: 'templates/world/world-content.html',
                        controller: 'WorldContentCtrl'
                    }
                }
            })


            //专栏
            .state('tabs.zhuanlan', {
                url: "/zhuanlan",
                views: {
                    'zhuanlan-tab': {
                        templateUrl: "templates/zhuanlan/index.html",
                        controller: 'ZhuanLanCtrl'
                    }
                }

            })
            .state('tabs.zhuanlan_content', {
                url: "/zhuanlan_content/:aid",
                views: {
                    'zhuanlan-tab': {
                        templateUrl: 'templates/zhuanlan/zhuanlan-content.html',
                        controller: 'ZhuanLanContentCtrl'
                    }
                }
            })




            .state('tabs.rr', {
                url: "/rr",
                views: {
                    'rr-tab': {
                        templateUrl: "templates/rr/index.html"
                    }
                }

            })


      $urlRouterProvider.otherwise("/tab/news");

    }]);
