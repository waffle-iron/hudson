`import DS from 'ember-data'`

Subscription = DS.Model.extend

  expiryDate: DS.attr 'date'
  user : DS.belongsTo 'user', inverse: 'subscriptions'

  humanizedExpiryDate: (->
    expiryDate = @get "expiryDate"
    expiryDate.toLocaleDateString()
  ).property "expiryDate"

`export default Subscription`
