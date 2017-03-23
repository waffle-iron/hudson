import { Model, hasMany, belongsTo } from 'ember-cli-mirage';

export default Model.extend({
  invoices: hasMany('invoice'),
  collaborations: hasMany("collaboration"),
  subscription: belongsTo("subscription")
});
