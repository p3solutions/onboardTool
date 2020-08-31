var app=angular.module("app",[])


app.controller("itemController",function($scope){
   $scope.selectActive=0;
  $scope.items=[
    {"id":1,"title":"Parameters"},
    {"id":2,"title":"Archival Complexity Calculation"},
    {"id":3,"title":"Archival Cost Estimate"}
    ];
    
  $scope.setActive=function(index)
  {
    $scope.selectActive=index;
  }
  
  $scope.previousItem=function()
  {
    var total=$scope.items.length
    if ($scope.selectActive >0) {
      $scope.selectActive--;
    }

  }
  
  $scope.nextItem=function()
  {
    var total = $scope.items.length - 1;
    if ($scope.selectActive < total) {
       $scope.selectActive++;
    }
    
  }
  
});
