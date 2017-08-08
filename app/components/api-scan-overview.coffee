`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

ApiScanOverviewComponent = Ember.Component.extend

    file: null
    tagName: ['tr']

    actions:
      stopAPIScan: ->
        fileId = @get "file.id"
        data =
          file_id: fileId
        that = @
        @get("ajax").post ENV.endpoints.apiScan, data:data
        .then (data) ->
          that.get("notify").success "API Scan Stopped Successfully"
        .catch (error) ->
          for error in error.errors
            that.get("notify").error error.detail?.message

`export default ApiScanOverviewComponent`
