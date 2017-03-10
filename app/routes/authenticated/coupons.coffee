`import Ember from 'ember'`

AuthenticatedCouponsRoute = Ember.Route.extend

  model: (params)->
    @get('store').findAll('coupon')

`export default AuthenticatedCouponsRoute`
