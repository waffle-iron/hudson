import { Factory, faker } from 'ember-cli-mirage';

export default Factory.extend({
  expiryDate: faker.date.future,
  duration: faker.random.number,
  scansLeft: faker.random.number
});
