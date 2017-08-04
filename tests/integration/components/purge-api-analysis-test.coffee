`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'purge-api-analysis', 'Integration | Component | purge api analysis', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{purge-api-analysis}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#purge-api-analysis}}
      template block text
    {{/purge-api-analysis}}
  """

  assert.equal @$().text().trim(), 'template block text'
