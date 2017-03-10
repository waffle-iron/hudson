import { Factory, faker } from 'ember-cli-mirage';
import ENUMS from 'hudson/enums';

export default Factory.extend({
  uuid: faker.random.number,
  dynamicStatus(){
    return faker.random.arrayElement(ENUMS.DYNAMIC_STATUS.VALUES);
  },
  name(){
    return faker.company.companyName();
  }
});
