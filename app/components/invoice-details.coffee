`import Ember from 'ember'`

InvoiceDetailsComponent = Ember.Component.extend

  discountAmount: (->
    price = @get "invoice.pricing.price"
    discount = @get "invoice.coupon.discount"
    price * discount/100
  ).property "invoice.pricing.price", "invoice.coupon.discount"

`export default InvoiceDetailsComponent`
