`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'analyses-split', 'Integration | Component | analyses split', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{analyses-split}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#analyses-split}}
      template block text
    {{/analyses-split}}
  """

  assert.equal @$().text().trim(), 'template block text'
