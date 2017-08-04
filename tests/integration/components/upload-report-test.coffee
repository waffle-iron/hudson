`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'upload-report', 'Integration | Component | upload report', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{upload-report}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#upload-report}}
      template block text
    {{/upload-report}}
  """

  assert.equal @$().text().trim(), 'template block text'
