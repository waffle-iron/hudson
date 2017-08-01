`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'scans-split', 'Integration | Component | scans split', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{scans-split}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#scans-split}}
      template block text
    {{/scans-split}}
  """

  assert.equal @$().text().trim(), 'template block text'
