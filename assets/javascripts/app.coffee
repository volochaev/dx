'use strict'

angular.module "DX.controllers", []
angular.module "DX.directives", []
angular.module "DX.services", []


@app = angular.module "DX", [
  "ngRoute"
  "DX.controllers"
  "DX.directives"
  "DX.services"
]

app.config [
  '$routeProvider'
  ($routeProvider) ->
    $routeProvider.when("/",
      templateUrl: "/templates/homepage.html"
      controller: "HomeController"
      resolve:
        session: (authService) ->
          user: do authService.getCurrentUser
    ).otherwise redirectTo: "/"
]
