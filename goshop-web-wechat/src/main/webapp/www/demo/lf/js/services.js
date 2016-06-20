angular.module('starter.services', [])

.factory('Storage', function() {
    return {
        set: function(key, data) {
          //  return window.localStorage.setItem(key, window.JSON.stringify(data));
            return window.localStorage.setItem(key, angular.toJson(data));
        },
        get: function(key) {

            return window.JSON.parse(window.localStorage.getItem(key));
        },
        remove: function(key) {
            return window.localStorage.removeItem(key);
        }
    };
})
/*
*http://cms.phonegap100.com/index.php?a=index&m=Api&method=articleListGet&cid=132
* */
//新闻
 .factory('PortalsFactory', function($resource, $rootScope,ENV) {
        var ApiUrl = ENV.mobileApi,
        // 用来存储话题类别的数据结构，包含了下一页、是否有下一页等属性
        topics = {},
        focus, //焦点图
        catid = 115;
        console.log(ApiUrl);
        var resource = $resource(ApiUrl, {}, {
            query: {
                method: 'get',
                params: {
                    a:'index',
                    m:'Api',
                    method:'articleListGet',
                    cid: '@catid',
                    p: '@page'

                },
                timeout: 20000
            }
        });


        return {
            fetchTopStories: function() {
                // console.log("currentTab: " + currentTab);
                var hasNextPage = true;   //是否有下一页
                resource.query({
                    cid: catid,
                    p: 1
                }, function(r) {
               //     console.log(r);
                    if (r.result.length < 20) {
                        hasNextPage = false;
                    }
                    topics[catid] = {
                        'nextPage': 2,
                        'hasNextPage': hasNextPage,
                        'data': r.result
                    };
                    focus=r.focus;

                    $rootScope.$broadcast('PortalList.portalsUpdated');

                });

            },
            getPortals: function() {
                if (topics[catid] === undefined) {
                    return false;
                }
                return topics[catid].data;
            },
            getFocus: function() {    //获取焦点图
                if (focus === undefined) {
                    return false;
                }
                return focus;
            },
            setCurrentCatgory: function(cid) {
                catid = cid;
                this.fetchTopStories();
                // $rootScope.$broadcast('ioniclub.topicsUpdated', topics[currentTab]);
            },
            getCurrentCatid: function() {
                return catid;
            },
            increaseNewPortals: function() {
                var nextPage = topics[catid].nextPage;
                var hasNextPage = topics[catid].hasNextPage;
                var portalsData = topics[catid].data;

                //console.log(nextPage)

                resource.query({
                    cid: catid,
                    p: nextPage

                }, function(r) {
                    // console.log(r);
                    nextPage++;
                    if (r.result.length < 20) {
                        hasNextPage = false;
                    }

                //    console.log(r.result);

                    portalsData = portalsData.concat(r.result);
                    topics[catid] = {
                        'nextPage': nextPage,
                        'hasNextPage': hasNextPage,
                        'data': portalsData
                    };

                    $rootScope.$broadcast('PortalList.portalsUpdated');

               });
            },
            hasNextPage: function() {
                if (topics[catid] === undefined) {
                    return false;
                }
                return topics[catid].hasNextPage;
            }
        };


    })

    .factory('NewsContentFactory', function($resource, $rootScope,ENV) {



        var ApiUrl = ENV.mobileApi,
        // 用来存储话题类别的数据结构，包含了下一页、是否有下一页等属性
            topic = '',

            collections = {};

        var resource = $resource(ApiUrl, {}, {
            query: {
                method: 'get',
                params: {
                    a:'index',
                    m:'Api',
                    method:'@articleContentGet',
                    id: '@id',
                    device_id:'@device_id',
                    article_id:'@article_id'

                },
                timeout: 20000
            }
        });
        return {
            get: function(device_id,aid) {
                return resource.query({
                    method:'articleContentGet',
                    id: aid,
                    device_id:device_id
                }, function(response) {
                    console.log(response);
                    topic = response.result;
                    $rootScope.$broadcast('NewsContent.newsUpdated', topic);
                });

            },
            getPortal: function() {
                return topic;
            },
            articleCollectionAdd: function(device_id,article_id) {    //文章收藏  为了方便放在这个服务里面
                return resource.query({
                    method:'articleCollectionAdd',
                    device_id: device_id,
                    article_id: article_id
                }, function(response) {
                    console.log(response);
                });
            },
            fetchArticleCollectionList: function(device_id) {    //文章收藏列表  为了方便放在这个服务里面
                return resource.query({
                    method:'articleCollectionGet',
                    device_id: device_id
                }, function(response) {
                    collections = response.result;
                    $rootScope.$broadcast('ArticleCollection.newsUpdated');
                });
            },
            getCollectionList: function() {
                return collections;
            }



        };
    })


    .factory('NewSearchFactory', function($resource, $rootScope,ENV) {



        var ApiUrl = ENV.mobileApi,
        // 用来存储话题类别的数据结构，包含了下一页、是否有下一页等属性
          topics = {};

        var resource = $resource(ApiUrl, {}, {
            query: {
                method: 'get',
                params: {
                    a:'index',
                    m:'Api',
                    method:'@articleSearchGet',
                    keyword:'@keyword'

                },
                timeout: 20000
            }
        });
        return {
            getSearchList: function() {
                return topics;
            },
            fetchArticleSearchList: function(keyword) {    //文章收藏列表  为了方便放在这个服务里面
                return resource.query({
                    method:'articleSearchGet',
                    keyword: keyword
                }, function(response) {
                    topics = response.result;
                    $rootScope.$broadcast('ArticleSearch.newsUpdated');
                });
            }



        };
    })

//社会列表

 /*
 *      http://www.phonegap100.com/appapi.php?a=getThreadCate 获取帖子分类
  http://www.phonegap100.com/appapi.php?a=getThreadList&fid=2&page=1 获取帖子列表
  http://www.phonegap100.com/appapi.php?a=getThreadContent&tid=138 帖子详情以及回复的内容
 * */

    .factory('WorldListFactory', function($resource, $rootScope,ENV) {

        var ApiUrl = ENV.mobileApi,
        // 用来存储话题类别的数据结构，包含了下一页、是否有下一页等属性
            topics = {},
            focus, //焦点图
            catid = 137;
        var resource = $resource(ApiUrl, {}, {
            query: {
                method: 'get',
                params: {
                    a:'index',
                    m:'Api',
                    method:'articleListGet',
                    cid: '@catid',
                    p: '@page'

                },
                timeout: 20000
            }
        });


        return {
            fetchTopStories: function() {
                // console.log("currentTab: " + currentTab);
                var hasNextPage = true;   //是否有下一页
                resource.query({
                    cid: catid,
                    p: 1
                }, function(r) {
                    // console.log(r);
                    if (r.result.length < 20) {
                        hasNextPage = false;
                    }
                    topics[catid] = {
                        'nextPage': 2,
                        'hasNextPage': hasNextPage,
                        'data': r.result
                    };
                    focus=r.focus;
                    $rootScope.$broadcast('WorldList.Updated');

                });

            },
            getPortals: function() {
                if (topics[catid] === undefined) {
                    return false;
                }
                return topics[catid].data;
            },
            getFocus: function() {    //获取焦点图
                if (focus === undefined) {
                    return false;
                }
                return focus;
            },
            setCurrentCatgory: function(cid) {
                catid = cid;
                this.fetchTopStories();
                // $rootScope.$broadcast('ioniclub.topicsUpdated', topics[currentTab]);
            },
            getCurrentCatid: function() {
                return catid;
            },
            increaseNewPortals: function() {
                var nextPage = topics[catid].nextPage;
                var hasNextPage = topics[catid].hasNextPage;
                var portalsData = topics[catid].data;

                //console.log(nextPage)

                resource.query({
                    cid: catid,
                    p: nextPage

                }, function(r) {
                    // console.log(r);
                    nextPage++;
                    if (r.result.length < 20) {
                        hasNextPage = false;
                    }

                    //    console.log(r.result);

                    portalsData = portalsData.concat(r.result);
                    topics[catid] = {
                        'nextPage': nextPage,
                        'hasNextPage': hasNextPage,
                        'data': portalsData
                    };

                    $rootScope.$broadcast('WorldList.Updated');

                });
            },
            hasNextPage: function() {
                if (topics[catid] === undefined) {
                    return false;
                }
                return topics[catid].hasNextPage;
            }
        };


    })
    /*
    *
     * http://www.phonegap100.com/appapi.php?a=getPortalCate 获取文章分类
     http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=2 获取文章列表
     http://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=121 获取文章详情
     http://www.phonegap100.com/appapi.php?a=getThreadCate 获取帖子分类
     http://www.phonegap100.com/appapi.php?a=getThreadList&fid=2&page=1 获取帖子列表
     http://www.phonegap100.com/appapi.php?a=getThreadContent&tid=138 帖子详情以及回复的内容
     * */

 //专栏

    .factory('ZhuanLanFactory', function($resource, $rootScope,ENV) {
        var ApiUrl = ENV.mobileApi,
        // 用来存储话题类别的数据结构，包含了下一页、是否有下一页等属性
            topics = {},
            focus, //焦点图
            catid =  113;
        console.log(ApiUrl);
        var resource = $resource(ApiUrl, {}, {
            query: {
                method: 'get',
                params: {
                    a:'index',
                    m:'Api',
                    method:'articleListGet',
                    cid: '@catid',
                    p: '@page'

                },
                timeout: 20000
            }
        });


        return {
            fetchTopStories: function() {
                // console.log("currentTab: " + currentTab);
                var hasNextPage = true;   //是否有下一页
                resource.query({
                    cid: catid,
                    p: 1
                }, function(r) {
                   // console.log(r);
                    if (r.result.length < 20) {
                        hasNextPage = false;
                    }
                    topics[catid] = {
                        'nextPage': 2,
                        'hasNextPage': hasNextPage,
                        'data': r.result
                    };

                    focus=r.focus;

                    $rootScope.$broadcast('ZhuanLan.portalsUpdated');

                });

            },
            getPortals: function() {
                if (topics[catid] === undefined) {
                    return false;
                }
                return topics[catid].data;
            },
            getFocus: function() {    //获取焦点图
                if (focus === undefined) {
                    return false;
                }
                return focus;
            },
            setCurrentCatgory: function(cid) {
                catid = cid;
                this.fetchTopStories();
                // $rootScope.$broadcast('ioniclub.topicsUpdated', topics[currentTab]);
            },
            getCurrentCatid: function() {
                return catid;
            },
            increaseNewPortals: function() {
                var nextPage = topics[catid].nextPage;
                var hasNextPage = topics[catid].hasNextPage;
                var portalsData = topics[catid].data;

                //console.log(nextPage)

                resource.query({
                    cid: catid,
                    p: nextPage

                }, function(r) {
                    // console.log(r);
                    nextPage++;
                    if (r.result.length < 20) {
                        hasNextPage = false;
                    }

                    //    console.log(r.result);

                    portalsData = portalsData.concat(r.result);
                    topics[catid] = {
                        'nextPage': nextPage,
                        'hasNextPage': hasNextPage,
                        'data': portalsData
                    };

                    $rootScope.$broadcast('ZhuanLan.portalsUpdated');

                });
            },
            hasNextPage: function() {
                if (topics[catid] === undefined) {
                    return false;
                }
                return topics[catid].hasNextPage;
            }
        };


 })

.factory('ZhuanLanContentFactory', function($resource, $rootScope,ENV) {
        var ApiUrl = ENV.api,
        // 用来存储话题类别的数据结构，包含了下一页、是否有下一页等属性
            topic = '';
        var resource = $resource(ApiUrl, {}, {
            query: {
                method: 'get',
                params: {
                    a:'getPortalArticle',
                    aid: '@aid'
                },
                timeout: 20000
            }
        });


        return {
            get: function(aid) {
                return resource.query({
                    aid: aid
                }, function(response) {
                    // console.log(response);
                    topic = response.result;
                    $rootScope.$broadcast('NewsContent.newsUpdated', topic);
                });

            },
            getPortal: function() {
                return topic;
            }
        };
    })



 //试听

.factory('VideoFactory', function($resource, $rootScope,ENV) {
    var ApiUrl = ENV.mobileApi,
    // 用来存储话题类别的数据结构，包含了下一页、是否有下一页等属性
        topics = {},
        catid=123       ;


    var resource = $resource(ApiUrl, {}, {
        query: {
            method: 'get',
            params: {
                a:'index',
                m:'Api',
                method:'videoListGet'
            },
            timeout: 20000
        }
    });


    return {
        fetchTopStories: function() {
            // console.log("currentTab: " + currentTab);
            var hasNextPage = true;   //是否有下一页
            resource.query({}, function(r) {
                // console.log(r);
                if (r.result.length < 5) {
                    hasNextPage = false;
                }
                topics[catid] = {
                    'nextPage': 2,
                    'hasNextPage': hasNextPage,
                    'data': r.result
                };
                $rootScope.$broadcast('Video.Updated');

            });

        },
        getPortals: function() {
            if (topics[catid] === undefined) {
                return false;
            }
            return topics[catid].data;
        },
        setCurrentCatgory: function(cid) {
            catid = cid;
            this.fetchTopStories();
            // $rootScope.$broadcast('ioniclub.topicsUpdated', topics[currentTab]);
        },
        getCurrentCatid: function() {
            return catid;
        },
        increaseNewPortals: function() {
            var nextPage = topics[catid].nextPage;
            var hasNextPage = topics[catid].hasNextPage;
            var portalsData = topics[catid].data;

            //console.log(nextPage)

            resource.query({}, function(r) {
                // console.log(r);
                nextPage++;
                if (r.result.length < 5) {
                    hasNextPage = false;
                }

                //    console.log(r.result);

                portalsData = portalsData.concat(r.result);
                topics[catid] = {
                    'nextPage': nextPage,
                    'hasNextPage': hasNextPage,
                    'data': portalsData
                };

                $rootScope.$broadcast('Video.Updated');

            });
        },
        hasNextPage: function() {
            if (topics[catid] === undefined) {
                return false;
            }
            return topics[catid].hasNextPage;
        }
    };


})
    .factory('VideoContentFactory', function($resource, $rootScope,ENV) {
        var ApiUrl = ENV.mobileApi,
        // 用来存储话题类别的数据结构，包含了下一页、是否有下一页等属性
            topic = '';

        var resource = $resource(ApiUrl, {}, {
            query: {
                method: 'get',
                params: {
                    a:'index',
                    m:'Api',
                    method:'VideoContentGet',
                    id:'@id'
                },
                timeout: 20000
            }
        });

        return {
            get: function(id) {
                return resource.query({
                    id: id
                }, function(response) {
                    topic = response.result;
                    $rootScope.$broadcast('VideoContent.Updated');
                });

            },
            getPortal: function() {
                return topic;
            }
        };
    })


//http://cms.phonegap100.com/index.php?a=index&m=Api&method=articleCateGet&cid=0
//s文章分类
.factory('CategoryFactory', function($resource, $rootScope,ENV) {
    var ApiUrl = ENV.mobileApi,
    // 用来存储话题类别的数据结构，包含了下一页、是否有下一页等属性
        res = '',

        other_cate=''  ;
    var resource = $resource(ApiUrl, {}, {
        query: {
            method: 'get',
            params: {
                a:'index',
                m:'Api',
                method:'@userArticleCateGet',   // userArticleCateGet  userArticleCateDelete   userArticleCateAdd
                device_id: '@device_id',
                cate_id: '@cate_id'
            },
            timeout: 20000
        }
    });


    return {
        fetch: function(device_id) {
            return resource.query({
                method:'userArticleCateGet',
                device_id: device_id
            }, function(response) {
                // console.log(response);
                res = response;

                $rootScope.$broadcast('Category.Updated', res);
            });

        },
        getCategory: function() {
            return res;
        },
        fetchOtherCate: function(device_id) {
            return resource.query({
                method:'otherArticleCateGet',
                device_id: device_id
            }, function(response) {
                // console.log(response);
                other_cate = response;

                $rootScope.$broadcast('otherCategory.Updated', other_cate);
            });

        },
        getOtherCategory: function() {
            return other_cate;
        } ,
        deleteCategory: function(device_id,cate_id) {
            return resource.query({
                method:'userArticleCateDelete',
                device_id: device_id,
                cate_id: cate_id
            }, function(response) {

            });
        },
        addCategory: function(device_id,cate_id) {
            return resource.query({
                method:'userArticleCateAdd',
                device_id: device_id,
                cate_id: cate_id
            }, function(response) {

            });
        }

    };
})


    .factory('WetherFactory', function($resource, $rootScope,ENV) {
        var ApiUrl = ENV.mobileApi,
        // 用来存储话题类别的数据结构，包含了下一页、是否有下一页等属性
            topic = '';
    var resource = $resource(ApiUrl, {}, {
            query: {
                method: 'get',
                params: {
                    a:'index',
                    m:'Api',
                    method:'getWether'
                },
                timeout: 20000
            }
        });


        return {
            get: function() {
                return resource.query({
                }, function(response) {

                   // console.log(response);
                    topic = response.weatherinfo;
                    $rootScope.$broadcast('Wether.Updated');
                });

            },
            getPortal: function() {
                return topic;
            }
        };
    })

    .factory('jpushService',['$http','$window','$document',function($http,$window,$document){
        var jpushServiceFactory={};

        //var jpushapi=$window.plugins.jPushPlugin;

        //启动极光推送
        var _init=function(config){
            $window.plugins.jPushPlugin.init();
            //设置tag和Alias触发事件处理
            document.addEventListener('jpush.setTagsWithAlias',config.stac,false);
            //打开推送消息事件处理
            $window.plugins.jPushPlugin.openNotificationInAndroidCallback=config.oniac;


            $window.plugins.jPushPlugin.setDebugMode(true);
        }
        //获取状态
        var _isPushStopped=function(fun){
            $window.plugins.jPushPlugin.isPushStopped(fun)
        }
        //停止极光推送
        var _stopPush=function(){
            $window.plugins.jPushPlugin.stopPush();
        }

        //重启极光推送
        var _resumePush=function(){
            $window.plugins.jPushPlugin.resumePush();
        }

        //设置标签和别名
        var _setTagsWithAlias=function(tags,alias){
            $window.plugins.jPushPlugin.setTagsWithAlias(tags,alias);
        }

        //设置标签
        var _setTags=function(tags){
            $window.plugins.jPushPlugin.setTags(tags);
        }

        //设置别名
        var _setAlias=function(alias){
            $window.plugins.jPushPlugin.setAlias(alias);
        }

        jpushServiceFactory.init=_init;
        jpushServiceFactory.isPushStopped=_isPushStopped;
        jpushServiceFactory.stopPush=_stopPush;
        jpushServiceFactory.resumePush=_resumePush;

        jpushServiceFactory.setTagsWithAlias=_setTagsWithAlias;
        jpushServiceFactory.setTags=_setTags;
        jpushServiceFactory.setAlias=_setAlias;
        return jpushServiceFactory;


    }]);


//articleCollectionAdd


//articleCollectionAdd