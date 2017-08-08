`import Ember from 'ember'`

ActiveDevicesComponent = Ember.Component.extend

  devices: (->
    @get("store").findAll "device"
  ).property()

`export default ActiveDevicesComponent`
