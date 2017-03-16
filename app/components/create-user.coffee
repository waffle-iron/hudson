`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

CreateUserComponent = Ember.Component.extend

  user: (->
    @get('store').createRecord('user')
  ).property()

  actions:

    addUser: ->
      that = @
      user = @get 'user'
      user.save()
      .then (data) ->
        that.send "closeModal"
        that.get("notify").success "User added!"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message


    openUserModal: ->
        @set "showUserModal", true

    closeModal: ->
      @set "showUserModal", false

`export default CreateUserComponent`
