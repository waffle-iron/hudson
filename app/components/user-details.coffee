`import Ember from 'ember'`
`import ENUMS from 'hudson/enums'`
`import ENV from 'hudson/config/environment'`

UserDetailsComponent = Ember.Component.extend

  newPassword: ""
  confirmPassword: ""
  selectedDuration: ""
  selectedPricing: ""
  selectedSource: ""
  totalScansLeft: ""
  limitedScans: ""
  sources: ENUMS.PAYMENT_SOURCE.CHOICES[0...-1]

  user: (->
    @get('store').createRecord('user')
  ).property()

  subscription: (->
    @get('store').createRecord('subscription')
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

  showSubscription: true
  editSubscription: false

  showScansLeft: true
  showExpiryDate: false


  hasScansLeft: true
  expiryDateSelected: false

  hasExpiryDate: true
  scansLeftSelected: false


  pricings: (->
    store = @get "store"
    store.findAll "pricing"
  ).property()

  coupons: (->
    store = @get "store"
    store.findAll "coupon"
  ).property()

  subscriptions: (->
    store = @get "store"
    store.findAll "subscription"
  ).property()

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

    editSubscription: ->
      @set "showSubscription", false
      @set "editSubscription", true

    cancelForm: ->
      @set "showHide", true
      @set "editUnedit", false

    cancelSubscription: ->
      @set "showSubscription", true
      @set "editSubscription", false


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

    saveSubscription: ->
      @set "showSubscription", true
      @set "editSubscription", false

    selectPlan: ->
      planType = parseInt @$('#select-plan-type').val()
      if planType is ENUMS.PLAN_TYPE.PER_SCAN
        @set "showScansLeft", true
        @set "showExpiryDate", false
      else
        @set "showScansLeft", false
        @set "showExpiryDate", true

    changePassword: ->
      newPassword = @get "newPassword"
      confirmPassword = @get "confirmPassword"

      if newPassword isnt confirmPassword
        return @get("notify").error "Password doesn't match"

      userId = @get "user.id"
      changePassword = [ENV.endpoints.changePassword, userId].join '/'
      data =
        password: newPassword
      that = @
      @get("ajax").post changePassword, data: data
      .then (data) ->
        that.get("notify").success "Password Changed"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

    addNamespaces: ->
      that = @
      user = @get 'user'
      user.save()
      .then (data) ->
        that.set "showHide", true
        that.set "editUnedit", false
        that.get("notify").success "Namespace added!"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

    saveSubscription: ->
      @set "selectedPricing", parseInt @$('#select-pricing').val()
      @set "selectedDuration", parseInt @$('#select-duration').val()
      @set "selectedSource", parseInt @$('#select-source').val()

      selectedDuration = @get "selectedDuration"

      if selectedDuration is ENUMS.PLAN_TYPE.PER_SCAN
        @set "hasScansLeft", true
        @set "scansLeftSelected", true
        @set "hasExpiryDate", false
        @set "expiryDateSelected", false
        @set "limitedScans", true

      else
        @set "hasScansLeft", false
        @set "scansLeftSelected", false
        @set "hasExpiryDate", true
        @set "expiryDateSelected", true
        @set "limitedScans", false
        @set "totalScansLeft", 0

      selectedPricing = @get "selectedPricing"
      selectedDuration = @get "selectedDuration"
      selectedSource = @get "selectedSource"
      totalScansLeft = @get "totalScansLeft"
      selectedExpiryDate = @get "selectedExpiryDate"
      limitedScans = @get "limitedScans"
      if Ember.isEmpty limitedScans
        limitedScans = @get "user.subscription.limitedScans"
      subscriptionId = @get "user.subscription.id"
      subscription = [ENV.endpoints.subscription, subscriptionId].join '/'
      that = @
      data =
        "data":
          "attributes":
            "duration": selectedDuration
            "source": selectedSource
            "scans-left": totalScansLeft
            "expiry-date": selectedExpiryDate
            "limited-scans": limitedScans
          "relationships":
            "pricing":
              "data": selectedPricing
          "type": "subscriptions"

      @get("ajax").patch subscription, data: JSON.stringify data
      .then (data) ->
        that.set "showSubscription", true
        that.set "editSubscription", false
        that.get("notify").success "Subscription updated!"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

    addNewSubscription: ->
      selectedPricing = @get "selectedPricing"
      selectedDuration = @get "selectedDuration"
      selectedSource = @get "selectedSource"
      showScansLeft = @get "showScansLeft"
      that = @
      data =
        pricing: selectedPricing
        duration: selectedDuration
        source: selectedSource
        scansLeft: showScansLeft
      @get("ajax").post ENV.endpoints.subscription, data: data
      .then (data) ->
        that.set "showHide", true
        that.set "editUnedit", false
        that.get("notify").success "Subscription added!"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

`export default UserDetailsComponent`
