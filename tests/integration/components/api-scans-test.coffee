`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'api-scans', 'Integration | Component | api scans', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{api-scans}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#api-scans}}
      template block text
    {{/api-scans}}
  """

  assert.equal @$().text().trim(), 'template block text'
