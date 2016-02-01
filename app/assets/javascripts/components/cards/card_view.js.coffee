@CardView = React.createClass
  render: ->
    React.DOM.div
      className: 'row'
      React.DOM.div
        className: 'col-md-6'
        React.DOM.h1
          className: 'title'
          @props.data.full_name
        React.DOM.h3
          "gender: #{ @props.data.gender }"
        React.DOM.img
          src: @props.data.image.url



