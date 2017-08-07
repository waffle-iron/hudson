`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'delete-app', 'Integration | Component | delete app', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{delete-app}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#delete-app}}
      template block text
    {{/delete-app}}
  """

  assert.equal @$().text().trim(), 'template block text'
