`import Ember from 'ember'`

AuthenticatedUsersRoute = Ember.Route.extend

  model: (params)->
    @get('store').findAll('user')

`export default AuthenticatedUsersRoute`
