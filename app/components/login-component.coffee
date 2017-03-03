`import Ember from 'ember'`

LoginComponentComponent = Ember.Component.extend
  session: Ember.inject.service 'session'
  actions:
    authenticate: ->
      that = @
      identification = @get "identification"
      password = @get "password"
      this.get('session').authenticate('authenticator:hudson', identification, password).catch(reason) ->
        that.get("notify").error "Invalid Account Details"


`export default LoginComponentComponent`
