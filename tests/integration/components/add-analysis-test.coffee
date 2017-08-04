`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'add-analysis', 'Integration | Component | add analysis', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{add-analysis}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#add-analysis}}
      template block text
    {{/add-analysis}}
  """

  assert.equal @$().text().trim(), 'template block text'
