`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'create-pricing', 'Integration | Component | create pricing', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{create-pricing}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#create-pricing}}
      template block text
    {{/create-pricing}}
  """

  assert.equal @$().text().trim(), 'template block text'
