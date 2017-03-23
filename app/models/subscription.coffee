`import DS from 'ember-data'`

Subscription = DS.Model.extend

  duration: DS.attr 'number'
  scansLeft: DS.attr 'number'
  expiryDate: DS.attr 'date'
  limitedScans: DS.attr 'boolean'
  user : DS.belongsTo 'user', inverse: 'subscription'
  pricing : DS.belongsTo 'pricing', inverse: 'subscriptions'

  perScanSubscription: (->
    limitedScans = @get "limitedScans"
    limitedScans
  ).property "limitedScans"

  humanizedExpiryDate: (->
    expiryDate = @get "expiryDate"
    expiryDate.toLocaleDateString()
  ).property "expiryDate"

`export default Subscription`
