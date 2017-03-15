`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'create-user', 'Integration | Component | create user', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{create-user}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#create-user}}
      template block text
    {{/create-user}}
  """

  assert.equal @$().text().trim(), 'template block text'
