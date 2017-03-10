`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

UserListComponent = Ember.Component.extend

  actions:

    addUser: ->
      that = @
      data =
        username: @get "userUsername"
        email: @get "userEmail"
        password: @get "userPassword"
        firstName: @get "userFirstName"
        lastName: @get "userLastName"
        namespaces: @get "userNamespaces"
      @get("ajax").post ENV.endpoints.addUser, data:data
      .then (data)->
        that.send "closeModal"
        that.get("notify").success "Collaboration added!"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message

      that = @

    openCollaborationModal: ->
        @set "showCollaborationModal", true

    closeModal: ->
      @set "showCollaborationModal", false

`export default UserListComponent`
