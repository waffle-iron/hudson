`import Ember from 'ember'`

LoginComponentComponent = Ember.Component.extend
  session: Ember.inject.service 'session'
  actions:
    authenticate: ->
      that = @
      identification = @get "identification"
      password = @get "password"
      this.get('session').authenticate('authenticator:hudson', identification, password)


`export default LoginComponentComponent`
