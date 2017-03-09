import { Factory, faker } from 'ember-cli-mirage';

export default Factory.extend({
  id (i) {
    return i+1;
  },
  uuid: faker.random.number,
  username: faker.name.firstName,
  expiryDate: faker.date.future,
  role: faker.name.jobTitle
});
