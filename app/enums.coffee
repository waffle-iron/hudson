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

  PAYMENT_DURATION:
    MONTHLY: 1
    QUATERLY: 3
    HALFYEARLY: 6
    YEARLY: 10

  PAYMENT_SOURCE:
    PAYPAL: 1
    STRIPE_MANUAL: 2
    BANK_TRANSFER: 3
    MANUAL: 4
    STRIPE_RECURRING: 5

  COLLABORATION_ROLE:
    ADMIN: 0
    MANAGER: 1
    READ_ONLY: 2

  PLAN_TYPE:
    PER_SCAN: 0
    REGULAR_USER: 1

  USER_ROLE:
    CO_FOUNDER: 1
    EMPLOYEE: 2
    PARTNER: 3
    REGULAR: 4

  USER_DEPARTMENT:
    TECHNOLOGY: 1
    SECURITY: 2
    SALES: 3
    MARKETING: 4
    DESIGN: 5

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
