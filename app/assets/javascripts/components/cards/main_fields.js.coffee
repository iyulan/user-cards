@MainFields = React.createClass
  getInitialState: ->
    first_name: @props.data.first_name
    last_name: @props.data.last_name
    gender: @props.data.gender
    data: @props.data
  handleSubmit: (e) ->
    e.preventDefault()
    @state.data.first_name = @state.first_name
    @state.data.last_name = @state.last_name
    @state.data.gender = @state.gender
    @props.handleNext 2, @state.data
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  valid: ->
    @state.first_name && @state.last_name && @state.gender
  checkedState: (val) ->
    if @state.gender == val then 'checked' else ''
  render: ->
    React.DOM.div
      className: 'fields-form'
      React.DOM.h2
        className: 'title'
        'Step 1'
      React.DOM.form
        className: 'form'
        onSubmit: @handleSubmit
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'First name'
            name: 'first_name'
            value: @state.first_name
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.input
            type: 'text'
            className: 'form-control'
            placeholder: 'Last name'
            name: 'last_name'
            value: @state.last_name
            onChange: @handleChange
        React.DOM.div
          className: 'form-group'
          React.DOM.label
            className: 'radio-inline'
            React.DOM.input
              type: 'radio'
              name: 'gender'
              value: '0'
              onChange: @handleChange
              checked: @checkedState('0')
              'Male'
          React.DOM.label
            className: 'radio-inline'
            React.DOM.input
              type: 'radio'
              name: 'gender'
              value: '1'
              onChange: @handleChange
              checked: @checkedState('1')
              'Female'
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Next'
