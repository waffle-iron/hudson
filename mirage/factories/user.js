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
  namespaces: faker.internet.domainName,
  projectCount: faker.random.number,
  dateJoined: faker.date.past,
  isActive: faker.random.boolean,
  anyNamespace: faker.random.boolean
});
