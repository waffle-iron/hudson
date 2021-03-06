`import DS from 'ember-data'`
`import ENUMS from 'hudson/enums'`

Invoice = DS.Model.extend
  user : DS.belongsTo 'user', inverse: 'invoices'
  amount: DS.attr 'string'
  paidOn: DS.attr 'date'
  source: DS.attr 'number'
  pricing: DS.belongsTo 'pricing', inverse:'invoices'
  coupon: DS.belongsTo 'coupon', inverse:'invoices'
  duration: DS.attr 'number'

  sourceType: (->
    switch @get "source"
      when ENUMS.PAYMENT_SOURCE.PAYPAL then "Paypal"
      when ENUMS.PAYMENT_SOURCE.STRIPE_MANUAL then "Stripe Manual"
      when ENUMS.PAYMENT_SOURCE.BANK_TRANSFER then "Bank Transfer"
      when ENUMS.PAYMENT_SOURCE.MANUAL then "Manual"
      when ENUMS.PAYMENT_SOURCE.STRIPE_RECURRING then "Stripe Recurring"
      else "unknown"
  ).property "source"

  durationText: (->
    switch @get "duration"
      when ENUMS.PAYMENT_DURATION.MONTHLY then "Monthly"
      when ENUMS.PAYMENT_DURATION.QUATERLY then "Quaterly"
      when ENUMS.PAYMENT_DURATION.HALFYEARLY then "Half Yearly"
      when ENUMS.PAYMENT_DURATION.YEARLY then "Yearly"
      else ""
  ).property "duration"

  paidOnHumanized: (->
    paidOn = @get "paidOn"
    paidOn.toLocaleDateString()
  ).property "paidOn"

  hasDiscount: (->
    discount = @get "coupon.discount"
    typeof(discount) isnt "undefined"
  ).property "coupon.discount"

`export default Invoice`
