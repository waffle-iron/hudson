`import Ember from 'ember'`

AuthenticatedInvoicesRoute = Ember.Route.extend

  model: (params)->
    @get('store').findAll('invoice')

`export default AuthenticatedInvoicesRoute`
