`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'user-overview', 'Integration | Component | user overview', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{user-overview}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#user-overview}}
      template block text
    {{/user-overview}}
  """

  assert.equal @$().text().trim(), 'template block text'
