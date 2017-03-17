import { Factory, faker } from 'ember-cli-mirage';

export default Factory.extend({
  expiryDate: faker.date.future
});
