`import DS from 'ember-data'`

Invoice = DS.Model.extend
  user : DS.belongsTo 'user', inverse: 'invoices'
  amount: DS.attr 'string'
  paidOn: DS.attr 'date'
  source: DS.attr 'number'
  pricing: DS.belongsTo 'pricing', inverse:'invoices'
  coupon: DS.belongsTo 'coupon', inverse:'invoices'
  duration: DS.attr 'number'

`export default Invoice`
