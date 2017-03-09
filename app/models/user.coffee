`import DS from 'ember-data'`

User = DS.Model.extend
  uuid: DS.attr 'string'
  username: DS.attr 'string'
  role: DS.attr 'string'
  expiryDate: DS.attr 'date'
`export default User`
