`import Ember from 'ember'`

AuthenticatedScansRoute = Ember.Route.extend

  model: (params) ->
    @get('store').findAll('file')

`export default AuthenticatedScansRoute`
