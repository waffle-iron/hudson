`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

PricingOverviewComponent = Ember.Component.extend

  tagName: ['tr']
  classNames: ['table-content']

  actions:
    deletePricing: ->
      pricing = @get 'pricing'
      pricingName = @get "pricing.name"
      deletedPricing = prompt "Enter the pricing name which you want to delete ", ""
      if deletedPricing isnt pricingName
        return @get("notify").error "Enter the right pricing name to delete it"
      that = @
      pricing.destroyRecord()
      .then (data) ->
        that.get("notify").success "Pricing " + pricingName + " has been deleted"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

`export default PricingOverviewComponent`
