`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

CreatePricingComponent = Ember.Component.extend

  pricing: (->
    @get('store').createRecord('pricing')
  ).property()

  actions:

    addPricing: ->
      that = @
      pricing = @get 'pricing'
      pricing.save()
      .then (data)->
        that.send "closeModal"
        that.get("notify").success "Pricing added!"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

    openPricingModal: ->
        @set "showPricingModal", true

    closeModal: ->
      @set "showPricingModal", false

`export default CreatePricingComponent`
