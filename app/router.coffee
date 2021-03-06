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
    @route 'pricing', path: '/pricing/:pricingId',
    @route 'coupons', path: '/coupons',
    @route 'coupon', path: '/coupon/:couponId',
    @route 'files', path: '/files',
    @route 'invoices', path: 'invoices',
    @route 'invoice', path: 'invoice/:invoiceId'
  @route 'reset'

`export default Router;`
