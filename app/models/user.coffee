`import DS from 'ember-data'`

User = DS.Model.extend
  uuid: DS.attr 'string'
  username: DS.attr 'string'
  firstName: DS.attr 'string'
  lastName: DS.attr 'string'
  expiryDate: DS.attr 'date'

  humanizedExpiryDate: (->
    expiryDate = @get "expiryDate"
    expiryDate.toLocaleDateString()
  ).property "expiryDate"

  fullName: (->
    firstName = @get "firstName"
    lastName = @get "lastName"
    firstName + " " + lastName
  ).property "firstName","lastName"
`export default User`
