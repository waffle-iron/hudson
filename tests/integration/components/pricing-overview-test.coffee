`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'pricing-overview', 'Integration | Component | pricing overview', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{pricing-overview}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#pricing-overview}}
      template block text
    {{/pricing-overview}}
  """

  assert.equal @$().text().trim(), 'template block text'
