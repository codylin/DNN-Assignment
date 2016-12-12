var GridController = function ($scope, Api) {
    $scope.data = {
        peopledata: {
            totalitems: 0,
            currentPage: 1,
            itemsperpage: 10,
            data: []
        }
    };
    function GetPeople() {


        Api.GetApiCall("People", "GetPeople", function (event) {

            if (event.hasErrors == true) {
                $scope.setError(event.error);
            } else {
                $scope.data.peopledata.data = event.result;
                $scope.data.peopledata.totalitems = $scope.data.peopledata.data.length;
            }
        });
    }
    GetPeople();

    $scope.pageChanged = function () {
        GetPeople();
    }
}

GridController.$inject = ['$scope', 'Api'];