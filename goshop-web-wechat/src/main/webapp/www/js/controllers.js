angular.module('starter.controllers', [])
    .controller('PortalCtrl', ['$scope','ENV','Storage','CategoryFactory','$ionicScrollDelegate','$ionicSlideBoxDelegate','NewSlideFactory','PortalsFactory',function($scope,ENV,Storage,CategoryFactory,$ionicScrollDelegate, $ionicSlideBoxDelegate,NewSlideFactory,PortalsFactory) {
        var all_cate_width=8; //定义默认的导航数量

        var w=window.innerWidth   //获取屏幕的宽度
            || document.documentElement.clientWidth
            || document.body.clientWidth;
        //获取分了数据v
        CategoryFactory.fetch(0);   //这里得传入设备id

        //推荐分类
        $scope.$on('Category.Updated', function() {

            $scope.categoryListData = CategoryFactory.getCategory();
            if(Storage.get('categoryListMyData')&&Storage.get('categoryListMyData').length>1) {
               $scope.categoryListMyData=Storage.get('categoryListMyData');
            }else{
                $scope.categoryListMyData=$scope.categoryListData;
                if($scope.categoryListMyData.length>=1){
                    Storage.set('categoryListMyData', $scope.categoryListMyData);
                }
            } 
            all_cate_width=$scope.categoryListMyData.length;
            $scope.all_cate_width=all_cate_width*25+'%';
        });

        NewSlideFactory.fetch();
        $scope.showloading=true;
        //首页幻灯
        $scope.$on('NewSlide.Updated', function() {
            $scope.newSlideListData = NewSlideFactory.getNewSlide();
            $scope.model = {
                activeIndex:0
            };
            $scope.pageClick = function(index){
                //alert(index);

                $scope.model.activeIndex = index;
            };

//当图片切换后，触发此事件，注意参数
            $scope.slideHasChanged = function($index){
                //alert($index);

            };
            //这是属性delegate-handle的验证使用的，其实没必要重定义，直接使用$ionicSlideBoxDelegate就可以
            $scope.delegateHandle = $ionicSlideBoxDelegate;
            $ionicSlideBoxDelegate.update();
        });


        //点击tab的时候改变内容
        $scope.changeTab = function(catid,index) {
            //暂时改下
            if(catid==2){
                catid=null;
            }
            //--------------------
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

        // 获取文章数据
        PortalsFactory.fetchTopStories();
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
    }])

 .controller('NewsContentCtrl', ['$scope','$stateParams','NewsContentFactory',function($scope,$stateParams,NewsContentFactory) {
     $scope.showloading=true;
     var aid=$stateParams.aid;
     NewsContentFactory.get(aid);
     $scope.$on('NewsContent.newsUpdated', function() {
         $scope.contentData = NewsContentFactory.getPortal();
         $scope.showloading=false;
         $scope.c_size='14';
     });
 }])
  
