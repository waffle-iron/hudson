`import Ember from 'ember'`

AuthenticatedUsersRoute = Ember.Route.extend
  session: Ember.inject.service()

  model: (params)->
    @get('store').findAll('user')

`export default AuthenticatedUsersRoute`
