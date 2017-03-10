`import DS from 'ember-data'`
import ENUMS from 'irene/enums';

File = DS.Model.extend
  uuid: DS.attr 'string',

  dynamicStatus(){
    return faker.random.arrayElement(ENUMS.DYNAMIC_STATUS.VALUES);
  },
  name(){
    return faker.company.companyName();
  }

`export default File`
