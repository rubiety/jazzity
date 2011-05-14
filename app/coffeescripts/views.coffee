$ ->
  Jazzity.Staff = Backbone.View.extend
    tagName: "div",
    className: "staff"

  Jazzity.ChordStaff = Jazzity.Staff.extend
    render: ->
      alert("Rendering Chord Staff")

  Jazzity.ScaleStaff = Jazzity.Staff.extend
    render: ->
      alert("Rendering Scale Staff")
    
