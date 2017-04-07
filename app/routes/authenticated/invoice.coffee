`import Ember from 'ember'`

AuthenticatedInvoiceRoute = Ember.Route.extend

  model: (params) ->
    @get('store').find('invoice', params.invoiceId)

`export default AuthenticatedInvoiceRoute`
