`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'active-devices-overview', 'Integration | Component | active devices overview', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{active-devices-overview}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#active-devices-overview}}
      template block text
    {{/active-devices-overview}}
  """

  assert.equal @$().text().trim(), 'template block text'
