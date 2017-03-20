`import Ember from 'ember'`

UserDetailsComponent = Ember.Component.extend

  isOverview: true
  isNamespace: false
  isSubscription: false

  addSubscription: true
  subscriptionForm: false

  showHide: true
  editUnedit: false

  overviewClass: Ember.computed "isOverview", ->
    if @get "isOverview"
      "is-active"
  namespaceClass: Ember.computed "isNamespace", ->
    if @get "isNamespace"
      "is-active"
  subscriptionClass: Ember.computed "isSubscription", ->
    if @get "isSubscription"
      "is-active"

  actions:
    displayOverview: ->
      @set "isOverview", true
      @set "isNamespace", false
      @set "isSubscription", false

    displayNamespace: ->
      @set "isOverview", false
      @set "isNamespace", true
      @set "isSubscription", false

    displaySubscription: ->
      @set "isOverview", false
      @set "isNamespace", false
      @set "isSubscription", true

    openSubscriptionForm: ->
      @set "addSubscription", false
      @set "subscriptionForm", true

    closeSubscriptionForm: ->
      @set "addSubscription", true
      @set "subscriptionForm", false

    editText: ->
      @set "showHide", false
      @set "editUnedit", true

    saveText: ->
      @set "showHide", true
      @set "editUnedit", false

`export default UserDetailsComponent`
