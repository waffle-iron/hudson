`import Ember from 'ember'`
`import config from 'hudson/config/environment'`

Router = Ember.Router.extend
  location: config.locationType
  rootURL: config.rootURL


Router.map ->


`export default Router;`
