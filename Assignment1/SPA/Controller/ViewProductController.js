var ViewProductController = function ($scope, $uibModalInstance, Api) {
    function CreatePerson(data) {
        Api.PostApiCall("People", "CreatePerson", data, function (event) {

            if (event.hasErrors == true) {
                $scope.setError(event.error);


            } else {
                if (event.result == 'Duplicate Primary Key Username') {
                    $scope.showUserNameError = true;
                }
                else {
                    $uibModalInstance.close();
                }
            }
        });
    }
    $scope.showUserNameError = false;
    $scope.closeModal = function () {
        $uibModalInstance.dismiss('cancel');
    }
    $scope.submit = function () {
        var status = '';

        if ($scope.formCreate.LastNameInput.$valid && $scope.formCreate.FirstNameInput.$valid &&
                $scope.formCreate.EmailInput.$valid && $scope.formCreate.UserNameInput.$valid) {
            var data = new Object();
            data['FirstName'] = $scope.FirstName,
            data['LastName'] = $scope.LastName,
            data['UserName'] = $scope.UserName,
            data['Email'] = $scope.Email,
        CreatePerson(data);
        }

    }

}

ViewProductController.$inject = ['$scope', '$uibModalInstance', 'Api'];