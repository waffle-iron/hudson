import { Factory, faker } from 'ember-cli-mirage';

export default Factory.extend({
  id (i) {
    return i+1;
  },
  uuid: faker.random.number,
  email: faker.internet.email,
  password: faker.internet.password,
  username: faker.name.firstName,
  firstName: faker.name.firstName,
  lastName: faker.name.lastName,
  expiryDate: faker.date.future
});
