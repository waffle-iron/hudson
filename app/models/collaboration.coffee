`import DS from 'ember-data'`
`import ENUMS from 'hudson/enums'`

Collaboration = DS.Model.extend

  user: DS.belongsTo 'user', inverse: 'collaborations'
  role: DS.attr 'number'
  username: DS.attr 'string'

  roleHumanized:(->
    switch @get "role"
      when ENUMS.COLLABORATION_ROLE.ADMIN then "Admin"
      when ENUMS.COLLABORATION_ROLE.MANAGER then "Manager"
      when ENUMS.COLLABORATION_ROLE.READ_ONLY then "Read Only"
  ).property "role"

`export default Collaboration`
