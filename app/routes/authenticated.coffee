`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

location = window.location

{inject: {service}, isEmpty, RSVP} = Ember

AuthenticatedRoute = Ember.Route.extend AuthenticatedRouteMixin,

  lastTransition: null
  session: service()

  beforeModel: (transition)->
    @set "lastTransition", transition
    @_super transition

  model: ->
    userId = @get "session.data.authenticated.user_id"
    @get('store').find('user',userId)

  actions:
    invalidateSession: ->
      @get('session').invalidate()  

`export default AuthenticatedRoute`
