`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

UserOverviewComponent = Ember.Component.extend

  tagName: ['tr']
  classNames: ['table-content']

  actions:
    deleteUser: ->
      fullName = @get "user.fullName"
      return if !confirm "Do you want to delete the user " + fullName + "?"
      that = @
      @get("ajax").post ENV.endpoints.deleteUser
      .then (data) ->
        that.get("notify").success "User " + fullName + "has been deleted"
        setTimeout ->
          window.location.reload() # FIXME: Hackish Way
        ,
          3 * 1000
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

`export default UserOverviewComponent`
