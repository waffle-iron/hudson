ENUMS =
  DYNAMIC_STATUS:
    NONE: 0
    BOOTING: 1
    READY: 2
    SHUTTING_DOWN: 3
    DOWNLOADING: 4
    INSTALLING: 5
    LAUNCHING: 6
    HOOKING: 7

# Populate `CHOICES`
for enumName, enumValues of ENUMS
  choices = []
  values = []
  enumValues['UNKNOWN'] = -1
  for key, value of enumValues
    choices.push {key: key, value: value}
    values.push value
  ENUMS[enumName]['CHOICES'] = choices
  ENUMS[enumName]['VALUES'] = values

`export default ENUMS;`    
