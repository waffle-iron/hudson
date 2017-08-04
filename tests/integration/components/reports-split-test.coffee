`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'reports-split', 'Integration | Component | reports split', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{reports-split}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#reports-split}}
      template block text
    {{/reports-split}}
  """

  assert.equal @$().text().trim(), 'template block text'
