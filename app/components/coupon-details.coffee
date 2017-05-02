`import Ember from 'ember'`

isEmpty = (inputValue)->
  return Ember.isEmpty inputValue

CouponDetailsComponent = Ember.Component.extend

  coupon: (->
    @get('store').createRecord('coupon')
  ).property()

  showHide: true
  editUnedit: false

  actions:

    editText: ->
      @set "showHide", false
      @set "editUnedit", true

    cancelForm: ->
      @set "showHide", true
      @set "editUnedit", false

    saveText: ->
      code = @get "coupon.code"
      discount = @get "coupon.discount"

      for inputValue in [code,discount]
        return @get("notify").error "Please fill all the details" if isEmpty inputValue

      that = @
      coupon = @get 'coupon'
      coupon.save()
      .then (data) ->
        that.set "showHide", true
        that.set "editUnedit", false
        that.get("notify").success "Coupon Updated!"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

`export default CouponDetailsComponent`
