angular.module("app").config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/"

  $stateProvider
    .state "login",
      url: "/"
      templateUrl: "login-template.html"
      controller: ($scope, $rootScope, $auth, $state) ->
        $scope.authenticate = ->
          $auth.authenticate('google').then (response) ->
            sessionStorage.id = response.data.id
            $state.go "projections"

    .state "projections",
      url: "/projections"
      templateUrl: "projections-template.html"
      resolve:
        user: (Restangular) ->
          Restangular.one("users", sessionStorage.id)
        projections: (user, Restangular) ->
          user.all("projections").getList()
      controller: ($scope, projections) ->
        $scope.projections = projections
        $scope.$watch "projections", (projections) ->
          $scope.total = projections.map (projection) ->
            projection.variation
          .reduce (x, y) -> x + y
        , true

    .state "projections.new",
      url: "/new"
      onEnter: ($mdDialog, $state, Restangular, user, projections) ->
        $mdDialog.show
          templateUrl: "projections-new-dialog-template.html"
          controller: ($scope) ->
            $scope.projection = {}
            $scope.create = ->
              user.all("projections").post($scope.projection).then (projection) ->
                projections.unshift projection
                $mdDialog.hide()

        .finally ->
          $state.go "projections"

    .state "projections.edit",
      url: "/:id/edit"
      resolve:
        projection: (user, projections, Restangular, $stateParams) ->
          (projection for projection in projections when projection.id is Number($stateParams.id))[0]

      onEnter: ($mdDialog, $state, Restangular, user, projection, projections) ->
        $mdDialog.show
          templateUrl: "projections-edit-dialog-template.html"
          controller: ($scope) ->
            $scope.projection = Restangular.copy(projection)
            $scope.destroy = ->
              $scope.projection.remove().then ->
                index = projections.indexOf projection
                projections.splice index, 1
                $mdDialog.hide()

            $scope.create = ->
              console.log $scope.projection
              $scope.projection.put().then ->
                projection.label = $scope.projection.label
                projection.variation = $scope.projection.variation
                $mdDialog.hide()

        .finally ->
          $state.go "projections"

.run ($rootScope) ->
  $rootScope.$on("$stateChangeError", console.log.bind(console));
