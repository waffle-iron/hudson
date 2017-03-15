import { Factory, faker } from 'ember-cli-mirage';
import ENUMS from 'hudson/enums';

export default Factory.extend({
  username: faker.name.firstName,
  role(){
    return faker.random.arrayElement(ENUMS.COLLABORATION_ROLE.VALUES);
  }
});
