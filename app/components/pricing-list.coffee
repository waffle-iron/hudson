`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

PricingListComponent = Ember.Component.extend

  actions:

    addPricing: ->
      that = @
      data =
        name: @get "pricingName"
        price: @get "pricingPrice"
        projectLimit: @get "pricingLimit"
        description: @get "pricingDescription"

      @get("ajax").post ENV.endpoints.addPricing, data:data
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

`export default PricingListComponent`
