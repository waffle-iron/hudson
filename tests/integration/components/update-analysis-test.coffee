`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'update-analysis', 'Integration | Component | update analysis', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{update-analysis}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#update-analysis}}
      template block text
    {{/update-analysis}}
  """

  assert.equal @$().text().trim(), 'template block text'
