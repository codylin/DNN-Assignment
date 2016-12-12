var MainController = function ($scope, $uibModal) {
    


    $scope.createUser = function () {
        var modalInstance = $uibModal.open({
            animation: true,
            templateUrl: '/SPA/Views/ViewProductWindow.html',
            controller: 'ViewProductController',
            size: "",
            resolve: {
                
                 
            }
        });
        
        
        
    }
}

MainController.$inject = ['$scope', '$uibModal'];