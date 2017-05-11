# Takes two parameters: container and application
initialize = (application) ->

  # injecting ajax service

  application.inject 'route', 'ajax', 'service:ajax'
  application.inject 'component', 'ajax', 'service:ajax'

  # injecting notification-messages service

  application.inject 'route', 'notify', 'service:notification-messages'
  application.inject 'component', 'notify', 'service:notification-messages'
  application.inject 'authenticator', 'notify', 'service:notification-messages'

  # Inject realtime
  application.inject 'component', 'realtime', 'service:realtime'

  # Inject Store
  application.inject 'component', 'store', 'service:store'

HudsonInitializer =
  name: 'hudson'
  initialize: initialize

`export {initialize}`
`export default HudsonInitializer`
