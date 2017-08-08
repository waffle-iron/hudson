`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

DynamicScanOverviewComponent = Ember.Component.extend

  file: null
  tagName: ['tr']

  actions:
    stopDynamicScan: ->
      fileId = @get "file.id"
      data =
        file_id: fileId
      that = @
      @get("ajax").post ENV.endpoints.dynamicScan, data:data
      .then (data) ->
        that.get("notify").success "Dynamic Scan Stopped Successfully"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

`export default DynamicScanOverviewComponent`
