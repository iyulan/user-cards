@CardForm = React.createClass
  getInitialState: ->
    step: 1
    data: { last_name: '', first_name: '', gender: '0', photo_id: '' }
  handleStep: (step, data) ->
    @setState step: step, data: data
  render: ->
    switch @state.step
      when 1 then React.createElement MainFields, handleNext: @handleStep, data: @state.data
      when 2 then React.createElement PhotoUploader, handleSave: @handleStep, handlePrev: @handleStep, data: @state.data
      when 3 then React.createElement CardView, data: @state.data

