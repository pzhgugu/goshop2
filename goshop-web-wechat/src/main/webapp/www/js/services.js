angular.module('starter.services', [])
    .factory('Storage', function() {
        return {
            set: function(key, data) {
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
    //s文章分类
    .factory('CategoryFactory', function($resource, $rootScope,ENV) {
        var categoryQueryUrl  = ENV.categoryQueryUrl,
            res = '',
            other_cate=''  ;

        var resource = $resource(categoryQueryUrl, {}, {
            query: {
                method: 'get',
                params: {
                    a:'index',
                    m:'Api',
                    method:'@userArticleCateGet',   // userArticleCateGet  userArticleCateDelete   userArticleCateAdd
                    device_id: '@device_id',
                    cate_id: '@cate_id'
                },
                isArray:true,
                timeout: 20000
            }
        });

        return {
            fetch: function(device_id) {
                return resource.query({
                    method:'userArticleCateGet',
                    device_id: device_id
                }, function(response) {
                    console.log("数据"+response);
                    res = response;
                    $rootScope.$broadcast('Category.Updated', res);
                },function (error) {
                    console.log("错误"+error);
                });
            },
            getCategory: function() {
                return res;
            }
        }
    })
.factory('NewSlideFactory', function($resource, $rootScope,ENV) {
    var resource = $resource(ENV.newSlideUrl, {}, {
        query: {
            method: 'get',
            isArray:true,
            timeout: 20000
        }
    });
    return {
        fetch: function() {
            return resource.query({}, function(response) {
                console.log("数据"+response);
                res = response;
                $rootScope.$broadcast('NewSlide.Updated', res);
            },function (error) {
                console.log("错误"+error);
            });
        },
        getNewSlide: function() {
            return res;
        }
    }
})
//文章
    .factory('PortalsFactory', function($resource, $rootScope,ENV) {
        var ApiUrl = ENV.articleLangUrl,
        // 用来存储话题类别的数据结构，包含了下一页、是否有下一页等属性
            topics = {},
            focus, //焦点图
            catid = null;
        console.log(ApiUrl);
        var resource = $resource(ApiUrl, {}, {
            query: {
                method: 'get',
                params: {
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
                    console.log(r);
                    hasNextPage = r.hasNextPage;
                    topics[catid] = {
                        'nextPage': r.nextPage,
                        'hasNextPage': hasNextPage,
                        'data': r.list
                    };
                    //focus=r.focus;

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
                    hasNextPage = r.hasNextPage;

                    portalsData = portalsData.concat(r.list);
                    topics[catid] = {
                        'nextPage': r.nextPage,
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

        // 用来存储话题类别的数据结构，包含了下一页、是否有下一页等属性
            var topic = '',

            collections = {};

        var resource = $resource(ENV.articleLangPageUrl, {}, {
            query: {
                method: 'get',
                params: {
                    id: '@id'
                },
                timeout: 20000
            }
        });
        return {
            get: function(aid) {
                return resource.query({
                    id: aid
                }, function(response) {
                    console.log(response);
                    topic = response;
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