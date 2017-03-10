`import Ember from 'ember'`

AuthenticatedCouponRoute = Ember.Route.extend

  model: (params) ->
    @get('store').find('coupon', params.couponId)

`export default AuthenticatedCouponRoute`
