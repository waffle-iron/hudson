`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`
`import ENV from 'hudson/config/environment'`

location = window.location

{inject: {service}, isEmpty, RSVP} = Ember

AuthenticatedRoute = Ember.Route.extend AuthenticatedRouteMixin,

  lastTransition: null
  session: service()

  beforeModel: (transition)->
    @set "lastTransition", transition
    @_super transition

  afterModel: ->
    @get('notify').setDefaultAutoClear ENV.notifications.autoClear

  model: ->
    userId = @get "session.data.authenticated.user_id"
    @get('store').find('user', userId)

  actions:
    invalidateSession: ->
      @get('session').invalidate()

`export default AuthenticatedRoute`
