`import Ember from 'ember'`

AuthenticatedFilesRoute = Ember.Route.extend

  model: (params) ->
    @get('store').findAll('file')

`export default AuthenticatedFilesRoute`
