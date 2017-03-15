`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

CreateCouponComponent = Ember.Component.extend

  actions:

    addCoupon: ->
      that = @
      data =
        name: @get "CouponName"
        price: @get "CouponPrice"

      @get("ajax").post ENV.endpoints.addCoupon, data:data
      .then (data)->
        that.send "closeModal"
        that.get("notify").success "Coupon added!"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

    openCouponModal: ->
        @set "showCouponModal", true

    closeModal: ->
      @set "showCouponModal", false

`export default CreateCouponComponent`
