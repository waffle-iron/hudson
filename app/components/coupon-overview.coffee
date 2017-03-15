`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

CouponOverviewComponent = Ember.Component.extend

  tagName: ['tr']
  classNames: ['table-content']

  actions:
    deleteCoupon: ->
      coupon = @get "coupon.code"
      return if !confirm "Do you want to delete the coupon " + coupon + "?"
      that = @
      @get("ajax").delete ENV.endpoints.deleteCoupon
      .then (data) ->
        that.get("notify").success "Coupon " + coupon + " has been deleted"
        setTimeout ->
          window.location.reload() # FIXME: Hackish way
        ,
          3 * 1000
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message


`export default CouponOverviewComponent`
