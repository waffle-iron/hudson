`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'generate-report', 'Integration | Component | generate report', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{generate-report}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#generate-report}}
      template block text
    {{/generate-report}}
  """

  assert.equal @$().text().trim(), 'template block text'
