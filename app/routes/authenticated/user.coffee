`import Ember from 'ember'`

AuthenticatedUserRoute = Ember.Route.extend

  model: (params) ->
    @get('store').find('user', params.userId)

`export default AuthenticatedUserRoute`
