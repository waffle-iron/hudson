# Takes two parameters: container and application
initialize = (application) ->

  # injecting ajax service

  application.inject 'route', 'ajax', 'service:ajax'
  application.inject 'component', 'ajax', 'service:ajax'

  # injecting notification-message service

  application.inject 'route', 'notify', 'service:notification-message'
  application.inject 'component', 'notify', 'service:notification-message'
  application.inject 'authenticator', 'notify', 'service:notification-message'

HudsonInitializer =
  name: 'hudson'
  initialize: initialize

`export {initialize}`
`export default HudsonInitializer`
