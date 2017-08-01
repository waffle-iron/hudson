`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'start-api-scan', 'Integration | Component | start api scan', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{start-api-scan}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#start-api-scan}}
      template block text
    {{/start-api-scan}}
  """

  assert.equal @$().text().trim(), 'template block text'
