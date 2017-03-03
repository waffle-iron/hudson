`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

{inject: {service}, isEmpty, RSVP} = Ember

AuthenticatedRoute = Ember.Route.extend AuthenticatedRouteMixin,

  lastTransition: null

  beforeModel: (transition) ->
    @set "lastTransition", transition
    @_super transitions

`export default AuthenticatedRoute`
