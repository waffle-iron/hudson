`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'dynamic-scans', 'Integration | Component | dynamic scans', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{dynamic-scans}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#dynamic-scans}}
      template block text
    {{/dynamic-scans}}
  """

  assert.equal @$().text().trim(), 'template block text'
