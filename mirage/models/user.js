import { Model, hasMany } from 'ember-cli-mirage';

export default Model.extend({
  invoices: hasMany('invoice'),
  collaborations: hasMany("collaboration")
  subscriptions: hasMany("subscription")
});
