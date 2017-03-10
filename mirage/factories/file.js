
import { Factory, faker } from 'ember-cli-mirage';

export default Factory.extend({
  uuid: faker.random.number,
  price: faker.commerce.price,
  projectsLimit: faker.random.number
});
