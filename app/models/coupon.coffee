`import DS from 'ember-data'`

Coupon = DS.Model.extend
  code: DS.attr 'string'
  discount: DS.attr 'string'
  invoices: DS.hasMany 'invoice', inverse:'coupon'

`export default Coupon`
