angular.module("DX.services").service "authService", ($http, $q) ->
  service = (
    getCurrentUser: ->
      if service.isAuthenticated()
        $q.when service.currentUser
      else
        $http.get('/api/users/show').then (resp) ->
          service.currentUser = resp.data

    currentUser: null

    isAuthenticated: ->
      !!service.currentUser
  )

  service
