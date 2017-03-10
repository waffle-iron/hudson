`import Ember from 'ember'`
`import ENV from 'hudson/config/environment'`

Router = Ember.Router.extend
  location: ENV.locationType
  rootURL: ENV.rootURL


Router.map ->

  @route 'login'
  @route 'recover'
  @route 'authenticated', path: '/', ->
    @route 'index', path: '/',
    @route 'users', path: '/users',
    @route 'user', path: '/user/:userId',
    @route 'pricings', path: '/pricings',
    @route 'pricing', path: '/pricing',
    @route 'coupons', path: '/coupons',
    @route 'coupon', path: '/coupon',
    @route 'scans', path: '/scans',
    @route 'invoices', path: 'invoices'

`export default Router;`
