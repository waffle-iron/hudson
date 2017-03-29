`import Ember from 'ember'`

InvoiceListComponent = Ember.Component.extend

  stat: (->
    @get('store').find('stat', 1)
  ).property()

`export default InvoiceListComponent`
