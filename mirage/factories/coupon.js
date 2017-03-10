import { Factory, faker } from 'ember-cli-mirage';

export default Factory.extend({
  discount: faker.commerce.price,
  code: faker.name.firstName
});
