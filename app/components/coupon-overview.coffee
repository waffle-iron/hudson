`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

CouponOverviewComponent = Ember.Component.extend

  tagName: ['tr']
  classNames: ['table-content']

  actions:
    deleteCoupon: ->
      coupon = @get 'coupon'
      couponCode = @get "coupon.code"
      deletedCoupon = prompt "Enter the coupon code which you want to delete ", ""
      if deletedCoupon is null
        return
      else if deletedCoupon isnt couponCode
        return @get("notify").error "Enter the right coupon code to delete it"
      that = @
      coupon.destroyRecord()
      .then (data) ->
        that.get("notify").success "Coupon " + couponCode + " has been deleted"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message


`export default CouponOverviewComponent`
