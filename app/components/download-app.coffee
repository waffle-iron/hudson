`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

DownloadAppComponent = Ember.Component.extend

  actions:
    downloadApp: ->
      fileId = @$('#file-number').val()
      data =
        file_id: fileId
        submit: "Download"
      that = @
      @get("ajax").post ENV.endpoints.downloadApp, data:data
      .then (data) ->
        that.get("notify").success "App Downloaded Successfully"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

`export default DownloadAppComponent`
