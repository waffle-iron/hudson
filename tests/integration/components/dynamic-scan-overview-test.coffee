`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'dynamic-scan-overview', 'Integration | Component | dynamic scan overview', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{dynamic-scan-overview}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#dynamic-scan-overview}}
      template block text
    {{/dynamic-scan-overview}}
  """

  assert.equal @$().text().trim(), 'template block text'
