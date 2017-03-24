`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

UserOverviewComponent = Ember.Component.extend

  tagName: ['tr']
  classNames: ['table-content']

  actions:
    deleteUser: ->
      user = @get 'user'
      userName = @get "user.username"
      return if !confirm "Do you want to delete the user " + userName + "?"
      that = @
      user.destroyRecord()
      .then (data) ->
        that.get("notify").success "User " + userName + " has been deleted"
        setTimeout ->
          window.location.reload() # FIXME: Hackish Way
        ,
          3 * 1000
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

`export default UserOverviewComponent`
