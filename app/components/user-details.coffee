`import Ember from 'ember'`

UserDetailsComponent = Ember.Component.extend
  showHide: true
  editUnedit: false
  actions:
    editText: ->
      @set "showHide", false
      @set "editUnedit", true

    saveText: ->
      @set "showHide", true
      @set "editUnedit", false

`export default UserDetailsComponent`
