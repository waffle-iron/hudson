`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`
`import ENV from 'hudson/config/environment'`

location = window.location

{inject: {service}, isEmpty, RSVP} = Ember

AuthenticatedRoute = Ember.Route.extend AuthenticatedRouteMixin,

  lastTransition: null
  session: service()
  realtime: service()

  beforeModel: (transition)->
    @set "lastTransition", transition
    @_super transition

  afterModel: ->
    @get('notify').setDefaultAutoClear ENV.notifications.autoClear

    that = @
    store = @get "store"

    realtime = @get "realtime"

    allEvents =

      object: (data) ->
          store.pushPayload data: data

      message: (data) ->
          message = data.message
          notifyType = data.notifyType
          that.get("notify").info message if notifyType is ENUMS.NOTIFY.INFO
          that.get("notify").success message if notifyType is ENUMS.NOTIFY.SUCCESS
          that.get("notify").warning message if notifyType is ENUMS.NOTIFY.WARNING
          that.get("notify").alert message if notifyType is ENUMS.NOTIFY.ALERT
          that.get("notify").error message if notifyType is ENUMS.NOTIFY.ERROR

      logout: ->
          localStorage.clear()
          location.reload()

      reload: ->
        location.reload()

      counter: (data) ->
        realtime.incrementProperty "#{data.type}Counter"


  model: ->
    userId = @get "session.data.authenticated.user_id"
    @get('store').find('user', userId)

  actions:
    invalidateSession: ->
      @get('session').invalidate()

`export default AuthenticatedRoute`
