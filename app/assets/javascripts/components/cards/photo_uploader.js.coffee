@PhotoUploader = React.createClass
  componentDidMount: ->
    that = @
    $('#input-fileupload').fileupload
      dataType: 'json'
      url: '/photos'
      done: (e, data) ->
        that.setState imageSrc: data.result.image.thumb.url, photoId: data.result.id

    obj = $('#dragandrophandler')
    obj.on 'dragenter', (e) ->
      e.stopPropagation()
      e.preventDefault()
      $(this).css 'border', '2px solid #0B85A1'
      return
    obj.on 'dragover', (e) ->
      e.stopPropagation()
      e.preventDefault()
      return
    obj.on 'drop', (e) ->
      $(this).css 'border', '2px dotted #0B85A1'
      e.preventDefault()
      return
  getInitialState: ->
    data: @props.data
    photoId: @props.data.photo_id
    imageSrc: @props.data.imageSrc
  handlePrev: ->
    @state.data.photo_id = @state.photoId
    @state.data.imageSrc = @state.imageSrc
    @props.handlePrev 1, @state.data
  handleSubmit: (e) ->
    that = @
    e.preventDefault()
    @state.data.photo_id = @state.photoId
    $.ajax
      method: 'POST'
      url: '/cards',
      data: { card: @state.data }
      dataType: 'json'
      success: (data) ->
        that.props.handleSave 3, data
  valid: ->
    @state.photoId
  render: ->
    React.DOM.div
      className: 'row'
      React.DOM.div
        className: 'col-md-4 col-md-offset-4'
        React.DOM.div
          className: 'upload-form'
          React.DOM.h2
            className: 'title'
            'Step 2'
          React.DOM.div
            id: 'dragandrophandler'
            'Drag & drop here'
          React.DOM.img
            src: @state.imageSrc
          React.DOM.form
            className: 'form'
            onSubmit: @handleSubmit
            React.DOM.div
              className: 'fileupload'
              React.DOM.input
                className: 'hidden'
                id: 'input-fileupload'
                type: 'file'
                name: 'photo[image]'
              React.DOM.input
                type: 'hidden'
                name: 'prev_image_id'
                value: @state.photoId
            React.DOM.a
              className: 'btn btn-primary'
              onClick: @handlePrev
              'Back'
            React.DOM.button
              type: 'submit'
              className: 'btn btn-primary'
              disabled: !@valid()
              'Save'
