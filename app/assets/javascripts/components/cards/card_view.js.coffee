@CardView = React.createClass
  render: ->
    React.DOM.div
      className: 'row'
      React.DOM.div
        className: 'col-md-4 col-md-offset-4'
        React.DOM.img
          src: @props.data.image.url
        React.DOM.h3
          className: 'title'
          @props.data.full_name



