/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    rootURL: '/',
    locationType: 'auto',
    modulePrefix: 'hudson',
    environment: environment,
    notifications: {
      autoClear: true,
      duration: 4000 // Milliseconds
    },
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      },
      EXTEND_PROTOTYPES: {
        // Prevent Ember Data from overriding Date.parse.
        Date: false
      }
    },
    namespace: "hudson",
    host: "https://api.appknox.com",
    'ember-cli-mirage': {
      enabled: false
    },
    emblemOptions: {
      blueprints: false
    },
    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    },
    'ember-simple-auth': {
      loginEndPoint: '/login',
      checkEndPoint: '/check',
      logoutEndPoint: '/logout',
      routeAfterAuthentication: 'authenticated.index',
      routeIfAlreadyAuthenticated: 'authenticated.index'
    },
    endpoints: {
      addUser: 'add_user',
      addPricing: 'add_pricing',
      addCoupon: 'add_coupon',
      deleteUser: 'delete_user',
      deletePricing: 'delete_pricing',
      deleteCoupon: 'delete_coupon'
    }
  };

  if (environment === 'yashwin') {
    ENV['ember-cli-mirage'] = {
      enabled: true
    };
    ENV['host'] = "http://0.0.0.0:8000";
  }

  if (environment === 'testing') {
    ENV['ember-cli-mirage'] = {
      enabled: false
    };
    ENV['host'] = "http://192.168.0.162:8000";
  }

  if (environment === 'development') {

  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {

  }

  return ENV;
};
