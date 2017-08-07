`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'search-upload-app', 'Integration | Component | search upload app', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{search-upload-app}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#search-upload-app}}
      template block text
    {{/search-upload-app}}
  """

  assert.equal @$().text().trim(), 'template block text'
