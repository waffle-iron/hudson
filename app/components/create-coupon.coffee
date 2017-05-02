`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

isEmpty = (inputValue)->
  return Ember.isEmpty inputValue

CreateCouponComponent = Ember.Component.extend

  coupon: (->
    @get('store').createRecord('coupon')
  ).property()

  stat: (->
    @get('store').find('stat', 1)
  ).property()

  actions:

    addCoupon: ->
      code = @get "coupon.code"
      discount = @get "coupon.discount"

      for inputValue in [code,discount]
        return @get("notify").error "Please fill all the details" if isEmpty inputValue

      that = @
      coupon = @get 'coupon'
      discount =  @get "coupon.discount"
      discountPercentage = discount/100
      coupon.set "discount", discountPercentage
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
