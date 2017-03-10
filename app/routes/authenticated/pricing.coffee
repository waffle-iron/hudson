`import Ember from 'ember'`

AuthenticatedPricingRoute = Ember.Route.extend

  model: (params) ->
    @get('store').find('pricing', params.pricingId)

`export default AuthenticatedPricingRoute`
