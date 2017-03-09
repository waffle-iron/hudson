`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

Router = Ember.Router.extend
  location: ENV.locationType
  rootURL: ENV.rootURL


Router.map ->

  @route 'login'
  @route 'recover'
  @route 'authenticated', path: '/', ->
    @route 'index', path: '/'
    @route 'users', path: '/users'
    @route 'pricings', path: 'pricings'
    @route 'projects', path: 'projects'

`export default Router;`
