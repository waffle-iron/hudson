`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

isEmpty = (inputValue)->
  return Ember.isEmpty inputValue

CreateUserComponent = Ember.Component.extend

  user: (->
    @get('store').createRecord('user')
  ).property()

  stat: (->
    @get('store').find('stat', 1)
  ).property()

  actions:

    anyNamespace: ->
      @set "user.anyNamespace", !@get "user.anyNamespace"

    addUser: ->
      username = @get "user.username"
      email = @get "user.email"
      password = @get "user.password"
      firstName = @get "user.firstName"
      lastName = @get "user.lastName"
      anyNamespace = @get "user.anyNamespace"
      namespaces = @get "user.namespaces"

      if !anyNamespace
        for inputValue in [namespaces]
          return @get("notify").error "Please fill all the details" if isEmpty inputValue

      for inputValue in [username,email,password,firstName,lastName]
        return @get("notify").error "Please fill all the details" if isEmpty inputValue

      that = @
      user = @get 'user'
      user.save()
      .then (data) ->
        that.send "closeModal"
        that.get("notify").success "User added!"
      .catch (error) ->
        for error in error?.errors
          that.get("notify").error error?.detail?.message


    openUserModal: ->
        @set "showUserModal", true

    closeModal: ->
      @set "showUserModal", false

`export default CreateUserComponent`
