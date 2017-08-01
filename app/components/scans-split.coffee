`import Ember from 'ember'`

ScansSplitComponent = Ember.Component.extend

  isDynamicScan: true
  isAPIScan: false
  isStartAPIScan: false

  dynamicScanClass: Ember.computed "isDynamicScan", ->
    if @get "isDynamicScan"
      "is-active"
  apiScanClass: Ember.computed "isAPIScan", ->
    if @get "isAPIScan"
      "is-active"

  startAPIScanclass: Ember.computed "isStartAPIScan", ->
    if @get "isStartAPIScan"
      "is-active"

  actions:
    displayDynamicScan: ->
      @set "isDynamicScan", true
      @set "isAPIScan", false
      @set "isStartAPIScan", false
    displayAPIScan: ->
      @set "isAPIScan", true
      @set "isDynamicScan", false
      @set "isStartAPIScan", false
    displayStartAPIScans: ->
      @set "isStartAPIScan", true
      @set "isDynamicScan", false
      @set "isAPIScan", false

`export default ScansSplitComponent`
