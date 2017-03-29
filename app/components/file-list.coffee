`import Ember from 'ember'`

FileListComponent = Ember.Component.extend

  stat: (->
    @get('store').find('stat', 1)
  ).property()

`export default FileListComponent`
