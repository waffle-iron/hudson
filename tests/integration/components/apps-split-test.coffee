`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'apps-split', 'Integration | Component | apps split', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{apps-split}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#apps-split}}
      template block text
    {{/apps-split}}
  """

  assert.equal @$().text().trim(), 'template block text'
