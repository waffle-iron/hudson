`import DS from 'ember-data'`

Device = DS.Model.extend
  platform: DS.attr 'number'
  package_name: DS.attr 'string'
  app_name: DS.attr 'string'
  platform_version: DS.attr 'string'
  serial_number: DS.attr 'number'
  is_connected: DS.attr 'boolean'
  is_available: DS.attr 'boolean'
  is_tablet: DS.attr 'boolean'

`export default Device`
