`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'search-upload-report', 'Integration | Component | search upload report', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{search-upload-report}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#search-upload-report}}
      template block text
    {{/search-upload-report}}
  """

  assert.equal @$().text().trim(), 'template block text'
