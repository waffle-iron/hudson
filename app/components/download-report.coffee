`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

DownloadReportComponent = Ember.Component.extend

  actions:
    downloadReport: ->
      fileId = @$('#file-number').val()
      debugger
      data =
        file_id: fileId
        submit: "Download"
      that = @
      @get("ajax").post ENV.endpoints.downloadReport, data:data
      .then (data) ->
        that.get("notify").success "Report Downloaded Successfully"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

`export default DownloadReportComponent`
