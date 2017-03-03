`import Ember from 'ember';`
`import Base from 'ember-simple-auth/authenticators/base';`
`import ENV from 'hudson/config/environment';`

b64EncodeUnicode = (str) ->
  btoa encodeURIComponent(str).replace /%([0-9A-F]{2})/g, (match, p1) ->
    String.fromCharCode '0x' + p1

getB64Token = (user, token)->
  b64EncodeUnicode "#{user}:#{token}"

processData = (data) ->
  data.b64token = getB64Token data.user_id, data.token
  data

HudsonAuthenticator = Base.extend

  ajax: Ember.inject.service()

  authenticate: (identification, password) ->
    ajax = @get "ajax"
    that = @
    new Ember.RSVP.Promise (resolve, reject) ->
      data =
        username: identification
        password: password

      url = ENV['ember-simple-auth']['loginEndPoint']
      ajax.post(url, {data:data})
      .then (data) ->
        data = processData data
        resolve data
        that.resumeTransistion()
      .catch (error) ->
        for error in error.errors
          that.get("notify").error.details?.message
        reject error


`export default HudsonAuthenticator;`
