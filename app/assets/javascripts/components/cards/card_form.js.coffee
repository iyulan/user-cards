@CardForm = React.createClass
  getInitialState: ->
    step: 1
    data: {}
  handleNext: (data) ->
    @setState step: 2, data: data
  handlePrev: (data) ->
    @setState step: 1, data: data
  render: ->
    switch @state.step
      when 1 then React.createElement MainFields, handleNext: @handleNext, data: @state.data
      when 2 then React.createElement PhotoUploader, handlePrev: @handlePrev, data: @state.data

