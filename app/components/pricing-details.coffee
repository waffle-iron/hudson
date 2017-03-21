`import Ember from 'ember'`

PricingDetailsComponent = Ember.Component.extend

  pricing: (->
    @get('store').createRecord('pricing/:id')
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
      that = @
      pricing = @get 'pricing'
      pricing.save()
      .then (data) ->
        that.set "showHide", true
        that.set "editUnedit", false
        that.get("notify").success "Pricing Updated!"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

`export default PricingDetailsComponent`
