/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'hudson',
    environment: environment,
    rootURL: '/',
    locationType: 'auto',
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
    namespace: "api",
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
      loginEndPoint: '/login'
    }
  };

  if (environment === 'yashwin') {
    ENV['ember-cli-mirage'] = {
      enabled: true
    };
    ENV['host'] = "http://0.0.0.0:8000";
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
