`import Ember from 'ember'`

AppsSplitComponent = Ember.Component.extend

  currentTab: "downloadApp"

  isDownloadApp: Ember.computed "currentTab", ->
    currentTab = @get "currentTab"
    currentTab is "downloadApp"

  isSearchDownloadApp: Ember.computed "currentTab", ->
    currentTab = @get "currentTab"
    currentTab is "searchDownloadApp"

  isUploadApp: Ember.computed "currentTab", ->
    currentTab = @get "currentTab"
    currentTab is "uploadApp"

  isSearchUploadApp: Ember.computed "currentTab", ->
    currentTab = @get "currentTab"
    currentTab is "searchUploadApp"

  isDeleteApp: Ember.computed "currentTab", ->
    currentTab = @get "currentTab"
    currentTab is "deleteApp"

  isDeleteProject: Ember.computed "currentTab", ->
    currentTab = @get "currentTab"
    currentTab is "deleteProject"

  actions:
    displayDownloadApp: ->
      @set "currentTab", "downloadApp"

    displaySearchDownloadApp: ->
      @set "currentTab", "searchDownloadApp"

    displayUploadApp: ->
      @set "currentTab", "uploadApp"

    displaySearchUploadApp: ->
      @set "currentTab", "searchUploadApp"

    displayDeleteApp: ->
      @set "currentTab", "deleteApp"

    displayDeleteProject: ->
      @set "currentTab", "deleteProject"  

`export default AppsSplitComponent`
