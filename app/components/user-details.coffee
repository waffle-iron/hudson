`import Ember from 'ember'`

UserDetailsComponent = Ember.Component.extend

  isOverview: true
  isNamespace: false
  isSubscription: false

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
      





`export default UserDetailsComponent`
