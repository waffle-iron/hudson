`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

PasswordResetComponent = Ember.Component.extend

  uuid: ""
  token: ""
  password: ""
  confirmPassword: ""

  validation_errors: []

  validate: ->
    @validation_errors = []
    password = @get "password"
    if password.length < 6
      @validation_errors.push "Password length should be 6"
      return
    confirmPassword = @get "confirmPassword"
    if password isnt confirmPassword
      @validation_errors.push "Password mismatch"
    @validation_errors

  actions:

    reset: ->
      that = @
      @validate()
      if @validation_errors.length > 0
        return that.get("notify").error "#{@validation_errors.join " & "}"
      password = @get "password"
      uuid = @get "uuid"
      token = @get "token"
      data =
        uuid: uuid
        token: token
        password: password
      @get("ajax").post ENV.endpoints.reset, data: data
      .then (data)->
        that.container.lookup("route:reset").transitionTo "login"
        that.get("notify").success " Password changed successfully"
      .catch (error) ->
        for error in error.errors
          that.get("notify").error error.detail?.message


`export default PasswordResetComponent`
