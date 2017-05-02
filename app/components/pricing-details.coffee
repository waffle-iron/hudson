`import Ember from 'ember'`

isEmpty = (inputValue)->
  return Ember.isEmpty inputValue

PricingDetailsComponent = Ember.Component.extend

  pricing: (->
    @get('store').createRecord('pricing')
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
      name = @get "pricing.name"
      price = @get "pricing.price"
      projectsLimit = @get "pricing.projectsLimit"
      description = @get "pricing.description"

      for inputValue in [name,price,projectsLimit,description]
        return @get("notify").error "Please fill all the details" if isEmpty inputValue

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
