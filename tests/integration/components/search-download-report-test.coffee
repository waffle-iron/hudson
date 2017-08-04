`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'search-download-report', 'Integration | Component | search download report', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{search-download-report}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#search-download-report}}
      template block text
    {{/search-download-report}}
  """

  assert.equal @$().text().trim(), 'template block text'
