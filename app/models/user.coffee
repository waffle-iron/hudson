`import DS from 'ember-data'`

User = DS.Model.extend
  uuid: DS.attr 'string'
  username: DS.attr 'string'
  email: DS.attr 'string'
  password: DS.attr 'string'
  firstName: DS.attr 'string'
  namespaces: DS.attr 'string'
  lastName: DS.attr 'string'
  projectCount: DS.attr 'number'
  invoices: DS.hasMany 'invoice', inverse:'user'
  collaborations: DS.hasMany 'collaboration', inverse:'user'
  files: DS.hasMany 'file', inverse:'user'
  subscriptions: DS.hasMany 'subscription', inverse:'user'

  fullName: (->
    firstName = @get "firstName"
    lastName = @get "lastName"
    firstName + " " + lastName
  ).property "firstName","lastName"
`export default User`
