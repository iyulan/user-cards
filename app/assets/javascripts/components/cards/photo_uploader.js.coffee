@PhotoUploader = React.createClass
  getInitialState: ->
    data: @props.data
  handlePrev: ->
    @props.handlePrev @state.data
  render: ->
    React.DOM.form
      className: 'form'
      onSubmit: @handleSubmit
      React.DOM.a
        onClick: @handlePrev
        'Back'
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        'Save'
