@MainFields = React.createClass
  getInitialState: ->
    first_name: @props.data.first_name
    last_name: @props.data.last_name
    gender: @props.data.gender
  handleSubmit: (e) ->
    e.preventDefault()
    # $.post '/cards', { card: @state }, (data) =>
    #   @props.handleNewCard data
    #   @setState @getInitialState()
    # , 'JSON'
    @props.handleNext { first_name: @state.first_name, last_name: @state.last_name, gender: @state.gender}
  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
  valid: ->
    @state.first_name && @state.last_name && @state.gender
  checkedState: (val) ->
    if @state.gender == val then 'checked' else ''
  render: ->
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
