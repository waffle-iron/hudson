`import DS from 'ember-data'`

User = DS.Model.extend
  uuid: DS.attr 'string'
  username: DS.attr 'string'
  email: DS.attr 'string'
  password: DS.attr 'string'
  firstName: DS.attr 'string'
  lastName: DS.attr 'string'
  namespaces: DS.attr 'string'
  projectCount: DS.attr 'number'
  dateJoined: DS.attr 'date'
  isActive: DS.attr 'boolean'
  anyNamespace: DS.attr 'boolean'
  invoices: DS.hasMany 'invoice', inverse:'user'
  collaborations: DS.hasMany 'collaboration', inverse:'user'
  subscription: DS.belongsTo 'subscription', inverse:'user'

  isAnyNamespace: (->
    anyNamespace= @get "anyNamespace"
    if anyNamespace is true
      "checked"
  ).property "anyNamespace"

  hasSubscription: (->
    subscription = @get "subscription"
    !Ember.isEmpty subscription
  ).property "subscription"

  fullName: (->
    firstName = @get "firstName"
    lastName = @get "lastName"
    firstName + " " + lastName
  ).property "firstName","lastName"

  dateJoinedHumanized: Ember.computed "dateJoined", ->
    dateJoined = @get "dateJoined"
    if Ember.isEmpty dateJoined
      return
    "#{dateJoined.toLocaleDateString()}"

  userStatus: (->
    isActive = @get "isActive"
    if isActive is false
      "active"
    else
      "inactive"
  ).property "isActive"

`export default User`
