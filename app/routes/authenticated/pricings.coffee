`import Ember from 'ember'`

AuthenticatedPricingsRoute = Ember.Route.extend

  model: (params)->
    @get('store').findAll('pricing')

`export default AuthenticatedPricingsRoute`
