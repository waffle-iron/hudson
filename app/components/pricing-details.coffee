`import Ember from 'ember'`

PricingDetailsComponent = Ember.Component.extend

  showHide: true
  editUnedit: false

  actions:
    
    editText: ->
      @set "showHide", false
      @set "editUnedit", true

    saveText: ->
      @set "showHide", true
      @set "editUnedit", false
`export default PricingDetailsComponent`
