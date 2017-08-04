`import Ember from 'ember'`

AnalysesSplitComponent = Ember.Component.extend

  currentTab: "searchUpdateAnalysis"

  isSearchUpdateAnalysis: Ember.computed "currentTab", ->
    currentTab = @get "currentTab"
    currentTab is "searchUpdateAnalysis"

  isPurgeAPIAnalysis: Ember.computed "currentTab", ->
    currentTab = @get "currentTab"
    currentTab is "purgeAPIAnalysis"

  isUpdateAnalysis: Ember.computed "currentTab", ->
    currentTab = @get "currentTab"
    currentTab is "updateAnalysis"

  isAddAnalysis: Ember.computed "currentTab", ->
    currentTab = @get "currentTab"
    currentTab is "addAnalysis"

  actions:
    displaySearchUpdateAnalysis: ->
      @set "currentTab", "searchUpdateAnalysis"

    displayPurgeAPIAnalysis: ->
      @set "currentTab", "purgeAPIAnalysis"

    displayUpdateAnalysis: ->
      @set "currentTab", "updateAnalysis"

    displayAddAnalysis: ->
      @set "currentTab", "addAnalysis"

`export default AnalysesSplitComponent`
