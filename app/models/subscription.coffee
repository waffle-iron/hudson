`import DS from 'ember-data'`

Subscription = DS.Model.extend

  expiryDate: DS.attr 'date'
  user : DS.belongsTo 'user', inverse: 'subscriptions'

`export default Subscription`
