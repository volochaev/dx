angular.module("DX.controllers").controller "HomeController", ($rootScope, $scope, $locale, session, authService, productService) ->
  productService.getFeatured().then (data) ->
    $('loader').slideUp()
    $scope.products = data.data
    return
  debugger
  $rootScope.current_user = session.user

  # $rootScope.current_user = {
  #   full_name: 'Nikolai',
  #   admin: true
  # }

  $rootScope.cart = {
    items: []
  }

  $scope.newProduct = {
    name: 'Create Product',
    images: ['/images/thumbnails/db_file_img_48_640xauto.jpg']
  }
