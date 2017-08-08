`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

PurgeApiAnalysisComponent = Ember.Component.extend

  actions:
    purgeAPIAnalyses: ->
      fileId = @$('#file-number').val()
      data =
        file_id: fileId
      that = @
      @get("ajax").post ENV.endpoints.purgeAPIAnalyses, data:data
      .then (data) ->
        that.get("notify").success "Success"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

`export default PurgeApiAnalysisComponent`
