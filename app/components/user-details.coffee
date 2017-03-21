`import Ember from 'ember'`
`import ENUMS from 'hudson/enums'`

UserDetailsComponent = Ember.Component.extend

  user: (->
    @get('store').createRecord('user')
  ).property()

  isOverview: true
  isNamespace: false
  isSubscription: false

  scansLeft: true
  expiryDate: true

  addSubscription: true
  subscriptionForm: false

  showHide: true
  editUnedit: false

  showScansLeft: true
  showExpiryDate: false

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

    cancelForm: ->
      @set "showHide", true
      @set "editUnedit", false

    saveText: ->
      that = @
      user = @get 'user'
      user.save()
      .then (data) ->
        that.set "showHide", true
        that.set "editUnedit", false
        that.get("notify").success "User Updated!"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

    selectPlan: ->
      planType = parseInt @$('#select-plan-type').val()
      if planType is ENUMS.PLAN_TYPE.PER_SCAN
        @set "showScansLeft", true
        @set "showExpiryDate", false
      else
        @set "showScansLeft", false
        @set "showExpiryDate", true


`export default UserDetailsComponent`
