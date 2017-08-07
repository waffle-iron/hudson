`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'download-app', 'Integration | Component | download app', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{download-app}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#download-app}}
      template block text
    {{/download-app}}
  """

  assert.equal @$().text().trim(), 'template block text'
