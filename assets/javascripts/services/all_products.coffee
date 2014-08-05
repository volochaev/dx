angular.module("DX.services").service "productService", ($http, $q) ->
  service = getFeatured: ->
    $http(
      method: "GET"
      url: "/api/products/featured"
    ).success((data, status) ->
      return data
    ).error (data, status) ->
      return {}
    # $http.get('/api/products/featured').then(data, status) ->
    #   if data.status is 200
    #     d.resolve data
    #   else
    #     d.reject data
    # return d.promise

  service

