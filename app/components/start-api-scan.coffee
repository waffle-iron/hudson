`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

StartApiScanComponent = Ember.Component.extend

  actions:
    startAPIScan: ->
      fileId = @$('#file-number').val()
      data =
        file_id: fileId
      that = @
      @get("ajax").post ENV.endpoints.startApiScan, data:data
      .then (data) ->
        that.get("notify").success "Started API Scan"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

`export default StartApiScanComponent`
