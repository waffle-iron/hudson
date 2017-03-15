`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'create-coupon', 'Integration | Component | create coupon', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{create-coupon}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#create-coupon}}
      template block text
    {{/create-coupon}}
  """

  assert.equal @$().text().trim(), 'template block text'
