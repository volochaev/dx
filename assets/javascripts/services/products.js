(function() {
  var productFactory = function($http) {
    var factory = {
      getFeatured: function() {
        return $http.get("/api/products/featured");
      }
    };

    return factory;
  };

  productFactory.$inject = ['$http'];

  angular.module('DX.services').factory('productFactory', productFactory);
});
