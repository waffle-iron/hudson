`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

isEmpty = (inputValue)->
  return Ember.isEmpty inputValue

CreatePricingComponent = Ember.Component.extend

  pricing: (->
    @get('store').createRecord('pricing')
  ).property()

  stat: (->
    @get('store').find('stat', 1)
  ).property()

  actions:

    addPricing: ->
      name = @get "pricing.name"
      price = @get "pricing.price"
      projectsLimit = @get "pricing.projectsLimit"
      description = @get "pricing.description"

      for inputValue in [name,price,projectsLimit,description]
        return @get("notify").error "Please fill all the details" if isEmpty inputValue

      that = @
      pricing = @get 'pricing'
      pricing.save()
      .then (data)->
        that.send "closeModal"
        $('#create-pricing').find("input, textarea").val("")
        that.get("notify").success "Pricing added!"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

    openPricingModal: ->
        @set "showPricingModal", true

    closeModal: ->
      @set "showPricingModal", false

`export default CreatePricingComponent`
