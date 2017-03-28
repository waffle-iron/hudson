`import Ember from 'ember'`
`import ENUMS from 'hudson/enums'`
`import ENV from 'hudson/config/environment'`

UserDetailsComponent = Ember.Component.extend

  newPassword: ""
  confirmPassword: ""

  sources: ENUMS.PAYMENT_SOURCE.CHOICES[0...-1]
  durations: ENUMS.PAYMENT_DURATION.CHOICES[0...-1]

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

  showSubscription: true
  editSubscription: false

  showScansLeft: true
  showExpiryDate: false


  hasScansLeft: true
  regularUserSelected: false

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

    editUser: ->
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


    updateUser: ->
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


    changePassword: ->
      newPassword = @get "newPassword"
      confirmPassword = @get "confirmPassword"

      if newPassword isnt confirmPassword
        return @get("notify").error "Password doesn't match"

      userId = @get "user.id"
      changePassword = [ENV.endpoints.changePassword, userId].join '/'
      data =
        "data":
          "attributes":
            "password": confirmPassword
          "type": "user"
      that = @
      @get("ajax").post changePassword, data: JSON.stringify data
      .then (data) ->
        that.get("notify").success "Password Changed"
        that.set "newPassword", ''
        that.set "confirmPassword", ''
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

    updatedPricingPlan: ->
      @set "updatedPricingPlan", parseInt @$('#updated-pricing-plan').val()

    updatedPaymentSource: ->
      @set "updatedPaymentSource", parseInt @$('#updated-payment-source').val()

    updatedPaymentType: ->
      updatedPaymentType = parseInt @$('.updated-payment-type').val()
      if updatedPaymentType is ENUMS.PLAN_TYPE.PER_SCAN
        @set "hasScansLeft", true
        @set "scansLeftSelected", true
        @set "hasExpiryDate", false
        @set "regularUserSelected", false
        @set "haslimitedScans", true
      else
        @set "hasScansLeft", false
        @set "scansLeftSelected", false
        @set "hasExpiryDate", true
        @set "regularUserSelected", true
        @set "haslimitedScans", false
        @set "totalScansLeft", 0

    changedDuration: ->
      @set "updatedDuration", parseInt @$('#changed-duration').val()

    updatedDuration: ->
      @set "updatedDuration", parseInt @$('#updated-duration').val()

    saveSubscription: ->

      pricingId = @get "user.subscription.pricing.id"
      paymentSource = @get "user.subscription.source"
      limitedScans = @get "user.subscription.limitedScans"
      scansLeftCount = @get "user.subscription.scansLeft"
      duration = @get "user.subscription.duration"

      updatedPricingPlan = @get "updatedPricingPlan"
      haslimitedScans = @get "haslimitedScans"
      updatedPaymentSource = @get "updatedPaymentSource"
      totalScansLeft = @get "totalScansLeft"
      updatedDuration = @get "updatedDuration"
      selectedExpiryDate = @get "selectedExpiryDate"

      if Ember.isEmpty updatedPricingPlan
        updatedPricingPlan = pricingId
      if Ember.isEmpty updatedPaymentSource
        updatedPaymentSource = paymentSource
      if Ember.isEmpty haslimitedScans
        haslimitedScans = limitedScans
      if Ember.isEmpty totalScansLeft
        totalScansLeft = scansLeftCount
      if Ember.isEmpty updatedDuration
        updatedDuration = duration

      userId = @get "user.id"
      subscriptionId = @get "user.subscription.id"
      subscription = [ENV.endpoints.subscription, subscriptionId].join '/'
      that = @
      data =
        "data":
          "attributes":
            "duration": updatedDuration
            "source": updatedPaymentSource
            "scans-left": totalScansLeft
            "expiry-date": selectedExpiryDate
            "limited-scans": haslimitedScans
          "relationships":
            "pricing":
              "data":
                "id": updatedPricingPlan
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
        that.get("notify").success "Subscription Updated!"
        setTimeout ->
          window.location.reload() # FIXME: Hackish Way
        ,
          3 * 1000
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message


    addedPricing: ->
      @set "addedPricing", parseInt @$('#added-pricing').val()

    addedSource: ->
      @set "addedSource", parseInt @$('#added-source').val()

    changedPaymentType: ->
      @set "changedPaymentType", parseInt @$('#added-payment-type').val()

      changedPaymentType = @get "changedPaymentType"

      if changedPaymentType is ENUMS.PLAN_TYPE.PER_SCAN
        @set "showExpiryDate", false
        @set "showScansLeft", true
        @set "haslimitedScans", true
      else
        @set "showExpiryDate", true
        @set "showScansLeft", false
        @set "haslimitedScans", false
        @set "totalScansLeft", 0

    addedDuration: ->
      @set "addedDuration", parseInt @$('#added-duration').val()


    addNewSubscription: ->

      addedPricing = @get "addedPricing"
      addedSource = @get "addedSource"
      addedDuration = @get "addedDuration"
      addedPricing = @get "addedPricing"

      totalScansLeft = @get "totalScansLeft"
      haslimitedScans = @get "haslimitedScans"
      selectedExpiryDate = @get "selectedExpiryDate"

      userId = @get "user.id"
      that = @
      data =
        "data":
          "attributes":
            "duration": addedDuration
            "source": addedSource
            "scans-left": totalScansLeft
            "expiry-date": selectedExpiryDate
            "limited-scans": haslimitedScans
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
