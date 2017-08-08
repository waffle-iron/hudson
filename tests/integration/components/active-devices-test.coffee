`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'active-devices', 'Integration | Component | active devices', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{active-devices}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#active-devices}}
      template block text
    {{/active-devices}}
  """

  assert.equal @$().text().trim(), 'template block text'
