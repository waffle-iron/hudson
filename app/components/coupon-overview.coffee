`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

CouponOverviewComponent = Ember.Component.extend

  tagName: ['tr']
  classNames: ['table-content']

  actions:
    deleteCoupon: ->
      coupon = @get 'coupon'
      couponCode = @get "coupon.code"
      return if !confirm "Do you want to delete the coupon " + couponCode + "?"
      that = @
      coupon.destroyRecord()
      .then (data) ->
        that.get("notify").success "Coupon " + couponCode + " has been deleted"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message


`export default CouponOverviewComponent`
