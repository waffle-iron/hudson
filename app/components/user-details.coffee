`import Ember from 'ember'`
`import ENUMS from 'hudson/enums'`
`import ENV from 'hudson/config/environment'`

UserDetailsComponent = Ember.Component.extend

  newPassword: ""
  confirmPassword: ""
  selectedDuration: ""
  selectedPricing: ""
  selectedSource: ""
  addedDuration: ""
  addedPricing: ""
  addedSource: ""
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

    updateSubscription: ->
      @set "selectedPricing", parseInt @$('#select-pricing').val()
      @set "selectedDuration", parseInt @$('#select-duration').val()
      @set "selectedSource", parseInt @$('#select-source').val()

      @set "addedPricing", parseInt @$('#add-pricing').val()
      @set "addedDuration", parseInt @$('#add-duration').val()
      @set "addedSource", parseInt @$('#add-source').val()

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

      addedDuration = @get "addedDuration"

      if addedDuration is ENUMS.PLAN_TYPE.PER_SCAN
        @set "limitedScans", true
        @set "showScansLeft", true
        @set "showExpiryDate", false
      else
        @set "limitedScans", false
        @set "totalScansLeft", 0
        @set "showScansLeft", false
        @set "showExpiryDate", true


    saveSubscription: ->

      userId = @get "user.id"
      selectedPricing = @get "selectedPricing"
      selectedDuration = @get "selectedDuration"
      selectedSource = @get "selectedSource"
      totalScansLeft = @get "totalScansLeft"
      selectedExpiryDate = @get "selectedExpiryDate"
      if selectedDuration is ENUMS.PLAN_TYPE.PER_SCAN
          limitedScans = true
      else
          limitedScans = false
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
              "data":
                "id": selectedPricing
                "type": "pricing"
            "user":
              "data":
                "id": userId
                "type": "user"
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

      addedDuration = @get "addedDuration"
      addedPricing = @get "addedPricing"
      addedSource = @get "addedSource"
      totalScansLeft = @get "totalScansLeft"
      selectedExpiryDate = @get "selectedExpiryDate"

      if addedDuration is ENUMS.PLAN_TYPE.PER_SCAN
          limitedScans = true
      else
          limitedScans = false

      userId = @get "user.id"
      that = @
      data =
        "data":
          "attributes":
            "duration": addedDuration
            "source": addedSource
            "scans-left": totalScansLeft
            "expiry-date": selectedExpiryDate
            "limited-scans": limitedScans
          "relationships":
            "pricing":
              "data":
                "id": addedPricing
                "type": "pricing"
            "user":
              "data":
                "id": userId
                "type": "user"
          "type": "subscriptions"
      @get("ajax").post ENV.endpoints.subscription, data: JSON.stringify data
      .then (data) ->
        that.get("notify").success "Subscription added!"
        setTimeout ->
          window.location.reload() # FIXME: Hackish Way
        ,
          3 * 1000
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

`export default UserDetailsComponent`
