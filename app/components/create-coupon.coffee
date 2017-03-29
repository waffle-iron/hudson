`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

CreateCouponComponent = Ember.Component.extend

  coupon: (->
    @get('store').createRecord('coupon')
  ).property()

  stat: (->
    @get('store').find('stat', 1)
  ).property()

  actions:

    addCoupon: ->
      that = @
      coupon = @get 'coupon'
      coupon.save()
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
