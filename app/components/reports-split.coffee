`import Ember from 'ember'`

ReportsSplitComponent = Ember.Component.extend

  currentTab: "generateReport"

  isGenerateReport: Ember.computed "currentTab", ->
    currentTab = @get "currentTab"
    currentTab is "generateReport"

  isSearchGenerateReport: Ember.computed "currentTab", ->
    currentTab = @get "currentTab"
    currentTab is "searchGenerateReport"

  isUploadReport: Ember.computed "currentTab", ->
    currentTab = @get "currentTab"
    currentTab is "uploadReport"

  isSearchUploadReport: Ember.computed "currentTab", ->
    currentTab = @get "currentTab"
    currentTab is "searchUploadReport"

  isDownloadReport: Ember.computed "currentTab", ->
    currentTab = @get "currentTab"
    currentTab is "downloadReport"

  isSearchDownloadReport: Ember.computed "currentTab", ->
    currentTab = @get "currentTab"
    currentTab is "searchDownloadReport"


  actions:
    displayGenerateReport: ->
      @set "currentTab", "generateReport"

    displaySearchGenerateReport: ->
      @set "currentTab", "searchGenerateReport"

    displayUploadReport: ->
      @set "currentTab", "uploadReport"

    displaySearchUploadReport: ->
      @set "currentTab", "searchUploadReport"

    displayDownloadReport: ->
      @set "currentTab", "downloadReport"

    displaySearchDownloadReport: ->
      @set "currentTab", "searchDownloadReport"




`export default ReportsSplitComponent`
