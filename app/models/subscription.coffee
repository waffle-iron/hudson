`import DS from 'ember-data'`
`import ENUMS from 'hudson/enums'`

Subscription = DS.Model.extend

  duration: DS.attr 'number'
  scansLeft: DS.attr 'number'
  expiryDate: DS.attr 'date'
  limitedScans: DS.attr 'boolean'
  source: DS.attr 'number'
  user : DS.belongsTo 'user', inverse: 'subscription'
  pricing : DS.belongsTo 'pricing', inverse: 'subscriptions'

  perScanSubscription: (->
    limitedScans = @get "limitedScans"
    limitedScans
  ).property "limitedScans"

  humanizedExpiryDate: (->
    expiryDate = @get "expiryDate"
    expiryDate?.toLocaleDateString()
  ).property "expiryDate"

  sourceType: (->
    switch @get "source"
      when ENUMS.PAYMENT_SOURCE.PAYPAL then "Paypal"
      when ENUMS.PAYMENT_SOURCE.STRIPE_MANUAL then "Stripe Manual"
      when ENUMS.PAYMENT_SOURCE.BANK_TRANSFER then "Bank Transfer"
      when ENUMS.PAYMENT_SOURCE.MANUAL then "Manual"
      when ENUMS.PAYMENT_SOURCE.STRIPE_RECURRING then "Stripe Recurring"
      else "unknown"
  ).property "source"

`export default Subscription`
