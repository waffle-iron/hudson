`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

UserOverviewComponent = Ember.Component.extend

  user: (->
    @get('store').createRecord('user')
  ).property()

  tagName: ['tr']
  classNames: ['table-content']

  actions:
    deleteUser: ->
      return if !confirm "Do you want to delete the user?"
      that = @
      user = @get 'user'
      user.destroyRecord()
      .then (data) ->
        that.get("notify").success "User has been deleted"
        setTimeout ->
          window.location.reload() # FIXME: Hackish Way
        ,
          3 * 1000
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

`export default UserOverviewComponent`
