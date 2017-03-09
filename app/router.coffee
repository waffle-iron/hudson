`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

Router = Ember.Router.extend
  location: ENV.locationType
  rootURL: ENV.rootURL


Router.map ->

  @route 'login'
  @route 'recover'
  @route 'authenticated', path: '/', ->
    @route 'index', path: '/',
    @route 'users', path: '/users',
    @route 'projects', path: '/projects',
    @route 'pricings', path: '/pricings'

`export default Router;`
