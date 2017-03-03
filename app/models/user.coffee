`import DS from 'ember-data'`

User = DS.Model.extend
  uuid: DS.attr 'string'
  username: DS.attr 'string'

`export default User`
