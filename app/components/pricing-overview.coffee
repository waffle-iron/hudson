`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

PricingOverviewComponent = Ember.Component.extend

  tagName: ['tr']
  classNames: ['table-content']

  actions:
    deletePricing: ->
      pricing = @get 'pricing'
      pricingName = @get "pricing.name"
      return if !confirm "Do you want to delete the pricing " + pricingName + "?"
      that = @
      pricing.destroyRecord()
      .then (data) ->
        that.get("notify").success "Pricing " + pricingName + " has been deleted"
        setTimeout ->
          window.location.reload() # FIXME: Hackish Way
        ,
          3 * 1000
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

`export default PricingOverviewComponent`
