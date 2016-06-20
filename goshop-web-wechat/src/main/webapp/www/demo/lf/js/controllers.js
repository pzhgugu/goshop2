angular.module('starter.controllers', [])

.controller('PortalCtrl', ['$scope','$rootScope','ENV','PortalsFactory','$ionicPopover','$ionicModal','$ionicPopup','Storage','CategoryFactory','$ionicActionSheet','$timeout','$ionicScrollDelegate','WetherFactory','$ionicSlideBoxDelegate',function($scope,$rootScope,ENV,PortalsFactory,$ionicPopover,$ionicModal,$ionicPopup,Storage,CategoryFactory,$ionicActionSheet,$timeout,$ionicScrollDelegate,WetherFactory,$ionicSlideBoxDelegate) {

        $scope.showloading=true;
        $scope.index=0;
        $scope.ENV=ENV;

        var all_cate_width=8; //定义默认的导航数量

        var w=window.innerWidth   //获取屏幕的宽度
            || document.documentElement.clientWidth
            || document.body.clientWidth;

        var device_id=Storage.get('device_id');


        //console.log('设备id：'+ Storage.get('device_id'));

        // 获取文章数据
        PortalsFactory.fetchTopStories();
        //获取分了数据
        CategoryFactory.fetch(device_id);   //这里得传入设备id


        CategoryFactory.fetchOtherCate(device_id);   //这里得传入设备 获取其他的分类数据




        //文章返回
        $scope.$on('PortalList.portalsUpdated', function() {
            // $timeout(function() {
            $scope.focuslListData = PortalsFactory.getFocus();
            $scope.portalListData = PortalsFactory.getPortals();
          //  $ionicSlideBoxDelegate.update();  //更新ionic SlideBox

            $scope.showloading=false
            $scope.$broadcast('scroll.refreshComplete');

            setTimeout(function(){
                $scope.$broadcast('scroll.infiniteScrollComplete')
            }, 2000 );


            $ionicSlideBoxDelegate.update();  //更新ionic SlideBox
        });


        //推荐分类
        $scope.$on('Category.Updated', function() {

            $scope.categoryListData = CategoryFactory.getCategory();

            if(Storage.get('categoryListMyData')&&Storage.get('categoryListMyData').length>1) {
                //  $scope.userInfo=Storage.get(storageKey);
                $scope.categoryListMyData=Storage.get('categoryListMyData');

               // console.log('缓存数据：'+$scope.categoryListMyData);

            }else{


                $scope.categoryListMyData=$scope.categoryListData['my_cate'];

            //    console.log('远程数据：'+$scope.categoryListMyData);

                if($scope.categoryListMyData.length>=1){

                    Storage.set('categoryListMyData', $scope.categoryListMyData);
                }
            }

            all_cate_width=$scope.categoryListMyData.length;
            $scope.all_cate_width=all_cate_width*25+'%';

            //$scope.categoryListOtherData='';

           // console.log($scope.categoryListOtherData);

         //   console.log($scope.categoryListMyData);




        });


        //全部其他分类
        $scope.$on('otherCategory.Updated', function() {

            $scope.categoryListOther = CategoryFactory.getOtherCategory();

            if(Storage.get('categoryListOtherData')&&Storage.get('categoryListOtherData').length>=1) {
                //  $scope.userInfo=Storage.get(storageKey);
                $scope.categoryListOtherData=Storage.get('categoryListOtherData');
            }else{

                $scope.categoryListOtherData=$scope.categoryListOther['other_cate'];
                if($scope.categoryListOtherData.length>1){

                    Storage.set('categoryListOtherData', $scope.categoryListOtherData);
                }
            }

          //  $scope.categoryListOtherData=$scope.categoryListData['other_cate'];

            // console.log($scope.categoryListOtherData);

        });


        
        //刷新数据
        $scope.doRefresh = function() {
            PortalsFactory.fetchTopStories();
        };

        $scope.loadMore = function() {
            // console.log("loadMore");
            PortalsFactory.increaseNewPortals();



        };
        //判断是否可以加载更多数据
        $scope.moreDataCanBeLoaded = function() {
            //console.log(PortalsFactory.hasNextPage());
            return PortalsFactory.hasNextPage();
        };

        //点击tab的时候改变内容
        $scope.changeTab = function(catid,index) {

            $scope.index=index;
           // alert( angular.element(this).parent());
            //angular.element(this).parent().children().removeClass('sub_button_select');
           // angular.element(this).addClass('sub_button_select');
            var a=document.getElementById('sub_header_list').getElementsByTagName('a');
            for (var i = 0; i < all_cate_width; i++) {
                a[i].className = "button button-clear ";
            }
            //鎶婄偣鍑荤殑閭ｄ釜鏄剧ず鍑烘潵
            a[index].className = "button button-clear sub_button_select";

            $ionicScrollDelegate.$getByHandle('s_header').scrollTo(index*(w/4)-50,0,true);

            PortalsFactory.setCurrentCatgory(catid);

            $ionicScrollDelegate.$getByHandle('news_list').scrollTop();



            $ionicSlideBoxDelegate.update();  //更新ionic SlideBox
        };



 //向左滑动的时候

        $scope.onSwipeLeft=function(index){

          //  console.log('onSwipeLeft'+index);


            if(index < all_cate_width){
                var a=document.getElementById('sub_header_list').getElementsByTagName('a');

                for (var i = 0; i < all_cate_width; i++) {
                    a[i].className = "button button-clear ";
                }


                a[index+1].className = "button button-clear sub_button_select";


                var cate_id=a[index+1].getAttribute('cate_id');


                $scope.index=index+1;
                $ionicScrollDelegate.$getByHandle('s_header').scrollTo($scope.index*(w/4)-50,0,true);
                PortalsFactory.setCurrentCatgory(cate_id);
            }



        }

        //向右滑动的时候

        $scope.onSwipeRight=function(index) {

            console.log('onSwipeRight'+index);

            if (index>0) {
                var a = document.getElementById('sub_header_list').getElementsByTagName('a');

                for (var i = 0; i < all_cate_width; i++) {
                    a[i].className = "button button-clear ";
                }
                a[index - 1].className = "button button-clear sub_button_select";


                var cate_id = a[index - 1].getAttribute('cate_id');
                $scope.index=index - 1;
                PortalsFactory.setCurrentCatgory(cate_id);

                $ionicScrollDelegate.$getByHandle('s_header').scrollTo($scope.index*(w/4)-50,0,true);
            }

        }

        //最上面的弹窗
        $ionicPopover.fromTemplateUrl("templates/news/popover.html", {
            scope: $scope
        }).then(function(popover){
            $scope.popover = popover;
        })
        $scope.openPopover = function($event) {   //打开的时候调用数据



            $scope.popover.show($event);
        };
        $scope.closePopover = function() {
            $scope.popover.hide();
        };






        //openCategoryModal 显示分类列表

        $ionicModal.fromTemplateUrl('templates/news/category.html', {
            scope: $scope
        }).then(function(modal) {
            $scope.newTopicModal = modal;
        });

        $scope.openCategoryModal = function() {

            $scope.newTopicModal.show();
        };

        // close new topic modal
        $scope.closeCategoryModal = function() {
            $scope.newTopicModal.hide();
        };

        $scope.is_close=false;

        //点击我的分类
        $scope.cateChangeTab=function(catid,key,catename){
            if($scope.is_close!=true){
              //  console.log('cateChangeTab');
            //    PortalsFactory.setCurrentCatgory(catid);


                var index=key;

                $scope.index=index;
                // alert( angular.element(this).parent());
                //angular.element(this).parent().children().removeClass('sub_button_select');
                // angular.element(this).addClass('sub_button_select');
                var a=document.getElementById('sub_header_list').getElementsByTagName('a');
                for (var i = 0; i < all_cate_width; i++) {
                    a[i].className = "button button-clear ";
                }
                //鎶婄偣鍑荤殑閭ｄ釜鏄剧ず鍑烘潵
                a[index].className = "button button-clear sub_button_select";

                $ionicScrollDelegate.$getByHandle('s_header').scrollTo(index*(w/4)-50,0,true);

                PortalsFactory.setCurrentCatgory(catid);

                $ionicSlideBoxDelegate.update();  //更新ionic SlideBox



                //如果分类页面点击进来的话关闭对应的分类页面
                $scope.newTopicModal.hide();

            }else{


                $scope.categoryListMyData.splice(key,1);
                //改变分类的长度

                all_cate_width=$scope.categoryListMyData.length;
                $scope.all_cate_width=all_cate_width*25+'%';






                $scope.categoryListOtherData.push({
                    'id':catid,
                    'name':catename

                });


               // CategoryFactory.deleteCategory(device_id,catid);

                Storage.set('categoryListMyData', $scope.categoryListMyData);

                Storage.set('categoryListOtherData', $scope.categoryListOtherData);


                $ionicScrollDelegate.$getByHandle('news_list').scrollTop();

                //CategoryFactory.fetch(device_id);   //这里得传入设备id
            }



        }
        //cateDelete 点击删除的时候



        $scope.cateDeleteAll=function(){


            $scope.showReorder=true;
            $scope.is_close=true;
        }

        $scope.cateNoDelete=function(){

            $scope.is_close=false;

            $scope.showReorder=false;

        }


        $scope.move_item = function(item, fromIndex, toIndex) {



          if(toIndex!=0){



                $scope.categoryListMyData.splice(fromIndex, 1);
                $scope.categoryListMyData.splice(toIndex, 0, item);
          //      console.log($scope.categoryListMyData);


                Storage.set('categoryListMyData', $scope.categoryListMyData);

              // Storage.set('categoryListOtherData', $scope.categoryListOtherData);

          }

        };



        //增加tab页面
        $scope.addMyTab=function(catid,key,catename){

          //  console.log(catename);
            $scope.categoryListOtherData.splice(key,1);


            //categoryListOtherData
            $scope.categoryListMyData.push({
                'id':catid,
                'name':catename

            });
            all_cate_width=$scope.categoryListMyData.length;
            $scope.all_cate_width=all_cate_width*25+'%';
           // console.log($scope.categoryListMyData);
           // CategoryFactory.addCategory(device_id,catid);


            Storage.set('categoryListMyData', $scope.categoryListMyData);

            Storage.set('categoryListOtherData', $scope.categoryListOtherData);


            //  CategoryFactory.fetch(device_id);   //这里得传入设备id

        }

        //设置字体
        $scope.changeSize=function(){
                //设置字体
                $scope.font_size = [
                    { text: "特大字号", value: "A" },
                    { text: "大字号", value: "B" },
                    { text: "中字号", value: "C" },
                    { text: "小字号", value: "D"}
                ];  //初始化字号
                $scope.c_size_key=Storage.get('c_size');
                if(!$scope.c_size_key) {
                    $scope.c_size_key='D';
                }
                $scope.d={
                    size:$scope.c_size_key
                };

                  // 调用$ionicPopup弹出定制弹出框
                $ionicPopup.show({
                    templateUrl: "templates/news/font-size.html",
                    title: "正文字体",
                    scope: $scope,
                    buttons: [
                        { text: "取消" },
                        {
                            text: "<b>确定</b>",
                            type: "button-positive",
                            onTap: function(e) {
                                if($scope.d.size=='A'){
                                    $scope.c_size='24';

                                }else if($scope.d.size=='B'){

                                    $scope.c_size='20';
                                }
                                else if($scope.d.size=='C'){

                                    $scope.c_size='16';
                                }else if($scope.d.size=='D'){

                                    $scope.c_size='14';
                                }else{

                                    $scope.c_size='14';
                                }
                                Storage.set('c_size',$scope.d.size);
                                $scope.closePopover();
                            }
                        }
                    ]

                })
         };



        //分享客户端
        $scope.shareClient=function(){

            var title= "廊坊纪检监察网";
            var content = "廊坊纪检监察网APP下载！";
            var url = "http://www.lfdi.lfang.gov.cn";
            var imageurl = ENV.imgUrl+'icon.png';



            window.plugins.Baidushare.bdshare(
                title,content,url,imageurl,function(success) {
                    if(success == 1){
                      //  alert("分享成功！"); //做业务处理

                    }else if(success == 2){
                       // alert("未分享成功！");//做业务处理
                    }else{
                       // alert("encode success: " + success);
                    }

                }, function(fail) {
                    alert("encoding failed: " + fail);
                }
            );


        }


        //分享客户端


        $scope.changePattern=function(){

                if($rootScope.night==true){
                    $rootScope.night=false;
                }else{
                    $rootScope.night=true;
                }


              $scope.closePopover();

        }


        //$ionicScrollDelegate

        //获取天气
//        WetherFactory.get();
//
//        //文章返回
//        $scope.$on('Wether.Updated', function() {
//            // $timeout(function() {
//            $scope.wetherData = WetherFactory.getPortal();
//
//            $scope.wetherData.temp1=parseInt($scope.wetherData.temp1);
//            $scope.wetherData.temp2=parseInt($scope.wetherData.temp2);
//
//
///*
//*
// $scope.wetherData.img1=$scope.wetherData.img1.replace("jpg","png");
// $scope.wetherData.img1=$scope.wetherData.img1.replace("gif","png");
//
// $scope.wetherData.img2=$scope.wetherData.img2.replace("jpg","png");
// $scope.wetherData.img2=$scope.wetherData.img2.replace("gif","png");
//*
//* */
//
//            $scope.wetherData.img1='img/icon/day/'+$scope.wetherData.img1+'.png';
//            $scope.wetherData.img2='img/icon/night/'+$scope.wetherData.img2+'.png';
//           // parseInt("1234blue")
//            //http://i.tq121.com.cn/i/mobile/images/d1.png
//            //console.log($scope.wetherData);
//        });





}])
.controller('NewsContentCtrl', ['$scope','$stateParams','$ionicHistory','NewsContentFactory','$ionicPopover','$ionicPopup','Storage','$ionicLoading','$ionicNavBarDelegate','VideoContentFactory','ENV',function($scope,$stateParams,$ionicHistory,NewsContentFactory,$ionicPopover,$ionicPopup,Storage,$ionicLoading,$ionicNavBarDelegate,VideoContentFactory,ENV) {
   var device_id=Storage.get('device_id');
    $scope.c_size_key=Storage.get('c_size');
    //页面刚加载的时候判断字体
    $scope.$on('$ionicView.beforeEnter', function() {
        if(!$scope.c_size_key) {
            $scope.c_size='14';
            $scope.c_size_key='D';
        }
        if($scope.c_size_key=='A'){
            $scope.c_size='24';

        }else if($scope.c_size_key=='B'){

            $scope.c_size='20';
        }
        else if($scope.c_size_key=='C'){

            $scope.c_size='16';
        }else if($scope.c_size_key=='D'){

            $scope.c_size='14';
        }

    });


       $scope.showloading=true;

        var aid=$stateParams.aid;
        NewsContentFactory.get(device_id,aid);
        $scope.$on('NewsContent.newsUpdated', function() {
            // $timeout(function() {
            $scope.contentData = NewsContentFactory.getPortal();
            //console.log('contentData:'+ $scope.contentData);

            if($scope.contentData.type==2){  //表示视频
                var video_id=$scope.contentData['video_url'];

               // console.log('video_id:'+video_id);
                VideoContentFactory.get(video_id);

            }else{
                $scope.showloading=false;
            }
         //   $scope.$broadcast('scroll.refreshComplete');
            // }, 100);
        });

        $scope.newsContentCollect = function(article_id) {
           // articleCollectionAdd
            console.log(article_id);

            if($scope.contentData['is_collect']==1){
                $scope.contentData['is_collect']=0;
                var s_title='取消收藏成功';
            }else{
                $scope.contentData['is_collect']=1;
                var s_title='收藏成功';
            }

            $ionicLoading.show({
                noBackdrop: true,
                template: s_title,
                duration: 1500
            });

            NewsContentFactory.articleCollectionAdd(device_id,article_id);


        };
        $scope.newsContentShare = function() {

           
		   	var title= $scope.contentData.title;
			var content = $scope.contentData.title;
			var url =ENV.siteUrl+ "index.php?m=Article&a=index&id="+$scope.contentData.id;
            var imageurl = ENV.imgUrl+'icon.png';

			window.plugins.Baidushare.bdshare(
				   title,content,url,imageurl,function(success) {	 
				  if(success == 1){
					// alert("分享成功！"); //做业务处理
				  }else if(success == 2){
					// alert("未分享成功！");//做业务处理
				  }else{
					//		alert("encode success: " + success);
				  }
				}, function(fail) {
					// alert("encoding failed: " + fail);
				}
			   );
		   
		 
        };



        //设置字体
        $scope.font_size = [
            { text: "特大字号", value: "A" },
            { text: "大字号", value: "B" },
            { text: "中字号", value: "C" },
            { text: "小字号", value: "D"}
        ];  //初始化字号
        if(!$scope.c_size_key) {
            $scope.c_size_key='D';
        }
        $scope.d={
            size:$scope.c_size_key
        };
        $scope.newsContentFontSize= function() {
                 // 调用$ionicPopup弹出定制弹出框
                $ionicPopup.show({
                    templateUrl: "templates/news/font-size.html",
                    title: "正文字体",
                    scope: $scope,
                    buttons: [
                        { text: "取消" },
                        {
                            text: "<b>确定</b>",
                            type: "button-positive",
                            onTap: function(e) {
                                if($scope.d.size=='A'){
                                    $scope.c_size='24';

                                }else if($scope.d.size=='B'){

                                    $scope.c_size='20';
                                }
                                else if($scope.d.size=='C'){

                                    $scope.c_size='16';
                                }else if($scope.d.size=='D'){

                                    $scope.c_size='14';
                                }else{

                                    $scope.c_size='14';
                                }
                                Storage.set('c_size',$scope.d.size);
                            }
                        }
                    ]

                })
        };






        //点击左侧的按钮出现分享




        //左右滑动

        $scope.onSwipeLeft= function() {
//435
            $scope.showloading=true;
            if($scope.contentData['next_id']!=''){

                NewsContentFactory.get(device_id,$scope.contentData['next_id']);
            }else{

                $scope.showloading=false;
            }


        };

        $scope.onSwipeRight= function() {

////432
//            $scope.showloading=true;
//            if($scope.contentData['pre_id']!=''){
//
//                NewsContentFactory.get(device_id,$scope.contentData['pre_id']);
//            }else{
//
//                $scope.showloading=false;
//            }

            $ionicNavBarDelegate.back();


        };






         //如果是视频的话去请求视频数据

        $scope.ENV=ENV;
       // $scope.showloading=true;
        $scope.$on('VideoContent.Updated', function() {
            // $timeout(function() {
            $scope.listData = VideoContentFactory.getPortal();
            $scope.showloading=false


        });


        $scope.playVideo=function(){
            // alert('12313');
            VideoPlayer.play("http://www.apiying.com/video/video/herman.mp4");
        }

















    }])

//搜索页面
 .controller('SearchContentCtrl', ['$scope','$http','$timeout','NewSearchFactory',function($scope,$http,$timeout,NewSearchFactory) {


        var timer = null;
        $scope.data = [];

        $scope.change = function(keyword){

            $timeout.cancel(timer);

            timer = $timeout(function(){

                NewSearchFactory.fetchArticleSearchList(keyword);

            },500);

        };

        $scope.$on('ArticleSearch.newsUpdated', function() {
            // $timeout(function() {
            $scope.listData = NewSearchFactory.getSearchList();
        });


    }])

//收藏页面
.controller('CollectContentCtrl', ['$scope','NewsContentFactory','Storage',function($scope,NewsContentFactory,Storage) {
    //console.log('CollectContentCtrl');

        $scope.showloading=true;
        var device_id=Storage.get('device_id');
        NewsContentFactory.fetchArticleCollectionList(device_id);
        $scope.$on('ArticleCollection.newsUpdated', function() {
            // $timeout(function() {
            $scope.listData = NewsContentFactory.getCollectionList();

          //  console.log($scope.listData);

            $scope.showloading=false
            //   $scope.$broadcast('scroll.refreshComplete');
            // }, 100);
        });




}])



//社会
.controller('WorldListCtrl', ['$scope','$rootScope','$ionicModal','ENV','WorldListFactory','$ionicSlideBoxDelegate',function($scope,$rootScope,$ionicModal,ENV,WorldListFactory,$ionicSlideBoxDelegate) {

        $scope.showloading=true;
        $scope.ENV=ENV;
        // 获取数据
               // 获取文章数据
        WorldListFactory.fetchTopStories();
        //获取分了数据
        //文章返回
        $scope.$on('WorldList.Updated', function() {
            // $timeout(function() {

            $scope.focuslListData = WorldListFactory.getFocus();
            $scope.wordlListData= WorldListFactory.getPortals();
            $scope.showloading=false;
            $scope.$broadcast('scroll.refreshComplete');

            setTimeout(function(){
                $scope.$broadcast('scroll.infiniteScrollComplete')
            }, 1000 );
            $ionicSlideBoxDelegate.update();  //更新ionic SlideBox
            //    setTimeout()
            // }, 100);
        });



        $scope.doRefresh = function() {
            WorldListFactory.fetchTopStories();
        };

        $scope.loadMore = function() {
            // console.log("loadMore");
            WorldListFactory.increaseNewPortals();
        };
        $scope.moreDataCanBeLoaded = function() {
            //console.log(PortalsFactory.hasNextPage());
            return WorldListFactory.hasNextPage();
        };





 }])

.controller('WorldContentCtrl', ['$scope','$stateParams','$ionicHistory','NewsContentFactory','$ionicPopover','$ionicPopup','Storage','$ionicLoading','$ionicNavBarDelegate','ENV',function($scope,$stateParams,$ionicHistory,NewsContentFactory,$ionicPopover,$ionicPopup,Storage,$ionicLoading,$ionicNavBarDelegate,ENV) {
        var device_id=Storage.get('device_id');
        $scope.c_size_key=Storage.get('c_size');
        //页面刚加载的时候判断字体
        $scope.$on('$ionicView.beforeEnter', function() {
            if(!$scope.c_size_key) {
                $scope.c_size='14';
                $scope.c_size_key='D';
            }
            if($scope.c_size_key=='A'){
                $scope.c_size='24';

            }else if($scope.c_size_key=='B'){

                $scope.c_size='20';
            }
            else if($scope.c_size_key=='C'){

                $scope.c_size='16';
            }else if($scope.c_size_key=='D'){

                $scope.c_size='14';
            }

        });



        $scope.showloading=true;

        var aid=$stateParams.aid;
        NewsContentFactory.get(device_id,aid);
        $scope.$on('NewsContent.newsUpdated', function() {
            // $timeout(function() {
            $scope.contentData = NewsContentFactory.getPortal();
            $scope.showloading=false
            //   $scope.$broadcast('scroll.refreshComplete');
            // }, 100);
        });

        $scope.newsContentCollect = function(article_id) {
            // articleCollectionAdd
            console.log(article_id);

            if($scope.contentData['is_collect']==1){
                $scope.contentData['is_collect']=0;
                var s_title='取消收藏成功';
            }else{
                $scope.contentData['is_collect']=1;
                var s_title='收藏成功';
            }

            $ionicLoading.show({
                noBackdrop: true,
                template: s_title,
                duration: 1500
            });

            NewsContentFactory.articleCollectionAdd(device_id,article_id);


        };
        $scope.newsContentShare = function() {
            var title= $scope.contentData.title;
            var content = $scope.contentData.title;
            var url =ENV.siteUrl+ "index.php?m=Article&a=index&id="+$scope.contentData.id;
            var imageurl = ENV.imgUrl+'icon.png';

            window.plugins.Baidushare.bdshare(
                title,content,url,imageurl,function(success) {
                    if(success == 1){
                        // alert("分享成功！"); //做业务处理
                    }else if(success == 2){
                        // alert("未分享成功！");//做业务处理
                    }else{
                        //		alert("encode success: " + success);
                    }
                }, function(fail) {
                    // alert("encoding failed: " + fail);
                }
            );

        };



        //设置字体
        $scope.font_size = [
            { text: "特大字号", value: "A" },
            { text: "大字号", value: "B" },
            { text: "中字号", value: "C" },
            { text: "小字号", value: "D"}
        ];  //初始化字号
        if(!$scope.c_size_key) {
            $scope.c_size_key='D';
        }
        $scope.d={
            size:$scope.c_size_key
        };
        $scope.newsContentFontSize= function() {
            // 调用$ionicPopup弹出定制弹出框
            $ionicPopup.show({
                templateUrl: "templates/news/font-size.html",
                title: "正文字体",
                scope: $scope,
                buttons: [
                    { text: "取消" },
                    {
                        text: "<b>确定</b>",
                        type: "button-positive",
                        onTap: function(e) {
                            if($scope.d.size=='A'){
                                $scope.c_size='24';

                            }else if($scope.d.size=='B'){

                                $scope.c_size='20';
                            }
                            else if($scope.d.size=='C'){

                                $scope.c_size='16';
                            }else if($scope.d.size=='D'){

                                $scope.c_size='14';
                            }else{

                                $scope.c_size='14';
                            }
                            Storage.set('c_size',$scope.d.size);
                        }
                    }
                ]

            })
        };






        //点击左侧的按钮出现分享




        //左右滑动

        $scope.onSwipeLeft= function() {
//435
            $scope.showloading=true;
            if($scope.contentData['next_id']!=''){

                NewsContentFactory.get(device_id,$scope.contentData['next_id']);
            }else{

                $scope.showloading=false;
            }


        };

        $scope.onSwipeRight= function() {

//432
//            $scope.showloading=true;
//            if($scope.contentData['pre_id']!=''){
//
//                NewsContentFactory.get(device_id,$scope.contentData['pre_id']);
//            }else{
//
//                $scope.showloading=false;
//            }

            $ionicNavBarDelegate.back();

        };




    }])



//专栏

.controller('ZhuanLanCtrl', ['$scope','$rootScope','ENV','ZhuanLanFactory','$ionicSlideBoxDelegate',function($scope,$rootScope,ENV,ZhuanLanFactory,$ionicSlideBoxDelegate) {


        $scope.showloading=true;

        $scope.ENV=ENV;

        // 获取数据
        ZhuanLanFactory.fetchTopStories();


        $scope.$on('ZhuanLan.portalsUpdated', function() {
            // $timeout(function() {

            $scope.focuslListData = ZhuanLanFactory.getFocus();
            $scope.portalListData = ZhuanLanFactory.getPortals();
            $scope.showloading=false;

            $ionicSlideBoxDelegate.update();  //更新ionic SlideBox
            $scope.$broadcast('scroll.refreshComplete');
            // }, 100);
        });

        $scope.doRefresh = function() {
            ZhuanLanFactory.fetchTopStories();
        };

        $scope.loadMore = function() {
            // console.log("loadMore");
            ZhuanLanFactory.increaseNewPortals();
            $scope.$broadcast('scroll.infiniteScrollComplete');
        };
        $scope.moreDataCanBeLoaded = function() {
            //console.log(ZhuanLanFactory.hasNextPage());
            return ZhuanLanFactory.hasNextPage();
        };

}])

//专栏详情
 .controller('ZhuanLanContentCtrl', ['$scope','$stateParams','$ionicHistory','NewsContentFactory','$ionicPopover','$ionicPopup','Storage','$ionicLoading','$ionicNavBarDelegate','ENV',function($scope,$stateParams,$ionicHistory,NewsContentFactory,$ionicPopover,$ionicPopup,Storage,$ionicLoading,$ionicNavBarDelegate,ENV) {
        var device_id=Storage.get('device_id');
        $scope.c_size_key=Storage.get('c_size');
        //页面刚加载的时候判断字体
        $scope.$on('$ionicView.beforeEnter', function() {
            if(!$scope.c_size_key) {
                $scope.c_size='14';
                $scope.c_size_key='D';
            }
            if($scope.c_size_key=='A'){
                $scope.c_size='24';

            }else if($scope.c_size_key=='B'){

                $scope.c_size='20';
            }
            else if($scope.c_size_key=='C'){

                $scope.c_size='16';
            }else if($scope.c_size_key=='D'){

                $scope.c_size='14';
            }

        });



        $scope.showloading=true;

        var aid=$stateParams.aid;
        NewsContentFactory.get(device_id,aid);
        $scope.$on('NewsContent.newsUpdated', function() {
            // $timeout(function() {
            $scope.contentData = NewsContentFactory.getPortal();
            $scope.showloading=false
            //   $scope.$broadcast('scroll.refreshComplete');
            // }, 100);
        });

        $scope.newsContentCollect = function(article_id) {
            // articleCollectionAdd
            console.log(article_id);

            if($scope.contentData['is_collect']==1){
                $scope.contentData['is_collect']=0;
                var s_title='取消收藏成功';
            }else{
                $scope.contentData['is_collect']=1;
                var s_title='收藏成功';
            }

            $ionicLoading.show({
                noBackdrop: true,
                template: s_title,
                duration: 1500
            });

            NewsContentFactory.articleCollectionAdd(device_id,article_id);


        };
        $scope.newsContentShare = function() {
            var title= $scope.contentData.title;
            var content = $scope.contentData.title;
            var url =ENV.siteUrl+ "index.php?m=Article&a=index&id="+$scope.contentData.id;

            var imageurl = ENV.imgUrl+'icon.png';

            window.plugins.Baidushare.bdshare(
                title,content,url,imageurl,function(success) {
                    if(success == 1){
                        // alert("分享成功！"); //做业务处理
                    }else if(success == 2){
                        // alert("未分享成功！");//做业务处理
                    }else{
                        //		alert("encode success: " + success);
                    }
                }, function(fail) {
                    // alert("encoding failed: " + fail);
                }
            );

        };



        //设置字体
        $scope.font_size = [
            { text: "特大字号", value: "A" },
            { text: "大字号", value: "B" },
            { text: "中字号", value: "C" },
            { text: "小字号", value: "D"}
        ];  //初始化字号
        if(!$scope.c_size_key) {
            $scope.c_size_key='D';
        }
        $scope.d={
            size:$scope.c_size_key
        };
        $scope.newsContentFontSize= function() {
            // 调用$ionicPopup弹出定制弹出框
            $ionicPopup.show({
                templateUrl: "templates/news/font-size.html",
                title: "正文字体",
                scope: $scope,
                buttons: [
                    { text: "取消" },
                    {
                        text: "<b>确定</b>",
                        type: "button-positive",
                        onTap: function(e) {
                            if($scope.d.size=='A'){
                                $scope.c_size='24';

                            }else if($scope.d.size=='B'){

                                $scope.c_size='20';
                            }
                            else if($scope.d.size=='C'){

                                $scope.c_size='16';
                            }else if($scope.d.size=='D'){

                                $scope.c_size='14';
                            }else{

                                $scope.c_size='14';
                            }
                            Storage.set('c_size',$scope.d.size);
                        }
                    }
                ]

            })
        };






        //点击左侧的按钮出现分享



        //左右滑动

        $scope.onSwipeLeft= function() {
//435
            $scope.showloading=true;
            if($scope.contentData['next_id']!=''){

                NewsContentFactory.get(device_id,$scope.contentData['next_id']);
            }else{

                $scope.showloading=false;
            }


        };

        $scope.onSwipeRight= function() {

//432
//            $scope.showloading=true;
//            if($scope.contentData['pre_id']!=''){
//
//                NewsContentFactory.get(device_id,$scope.contentData['pre_id']);
//            }else{
//
//                $scope.showloading=false;
//            }


            $ionicNavBarDelegate.back();

        };




    }])

//试听
.controller('VideoCtrl', ['$scope','$rootScope','ENV','VideoFactory',function($scope,$rootScope,ENV,VideoFactory) {



        $scope.showloading=true;

        $scope.ENV=ENV;

        // 获取数据
        VideoFactory.fetchTopStories();

        $scope.$on('Video.Updated', function() {
            // $timeout(function() {
            $scope.videoListData = VideoFactory.getPortals();
            $scope.showloading=false
            $scope.$broadcast('scroll.refreshComplete');
            // }, 100);
        });

        $scope.doRefresh = function() {
            VideoFactory.fetchTopStories();
        };

        $scope.loadMore = function() {
            // console.log("loadMore");
            VideoFactory.increaseNewPortals();
            $scope.$broadcast('scroll.infiniteScrollComplete');
        };
        $scope.moreDataCanBeLoaded = function() {
            //console.log(ZhuanLanFactory.hasNextPage());
            return VideoFactory.hasNextPage();
        };


}])
//试听
    .controller('VideoContentCtrl', ['$scope','$rootScope','ENV','VideoContentFactory','$stateParams',function($scope,$rootScope,ENV,VideoContentFactory,$stateParams) {

        //console.log('VideoContentCtrl');

        var id=$stateParams.id;
        $scope.ENV=ENV;
        $scope.showloading=true;
        VideoContentFactory.get(id);
        $scope.$on('VideoContent.Updated', function() {
            // $timeout(function() {
            $scope.listData = VideoContentFactory.getPortal();
            $scope.showloading=false


        });


        $scope.playVideo=function(){
           // alert('12313');
            if($scope.listData.video_url!=''){
                VideoPlayer.play(ENV.siteUrl+$scope.listData.video_url);
            }else{
                VideoPlayer.play("http://www.apiying.com/video/video/herman.mp4");
            }
        }


    }]);

