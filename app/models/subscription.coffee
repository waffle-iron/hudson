`import DS from 'ember-data'`

Subscription = DS.Model.extend

  duration: DS.attr 'number'
  scansLeft: DS.attr 'number'
  expiryDate: DS.attr 'date'
  limitedScans: DS.attr 'boolean'
  user : DS.belongsTo 'user', inverse: 'subscriptions'
  pricing : DS.belongsTo 'pricing', inverse: 'subscriptions'


  humanizedExpiryDate: (->
    expiryDate = @get "expiryDate"
    expiryDate.toLocaleDateString()
  ).property "expiryDate"

`export default Subscription`
