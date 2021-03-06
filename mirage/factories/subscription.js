import { Factory, faker } from 'ember-cli-mirage';

export default Factory.extend({
  expiryDate: faker.date.future,
  duration: faker.random.number,
  scansLeft: faker.random.number,
  source: faker.random.number,
  limitedScans: faker.random.boolean
});
