/**
 * Created by aisheng on 2015/8/26.
 */
angular.module("starter.directive", [])
    .directive('hideTabs',function($rootScope){
        return {
            restrict:'AE',
            link:function($scope){
                $rootScope.hideTabs = 'tabs-item-hide';
                $scope.$on('$destroy',function(){
                    $rootScope.hideTabs = ' ';
                })
            }
        }
    });
