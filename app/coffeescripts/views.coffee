window.Jazzity or= {}

Jazzity.Staff = Backbone.View.extend
  tagName: "div",
  className: "staff"

  draw_stave: (clef = "treble", options = {})->
    options["width"] ||= 170
    options["height"] ||= 120

    this.canvas_element = $("<canvas width='#{options.width}' height='#{options.height}'></canvas>")
    this.canvas_element.appendTo(this.el)
    this.canvas = this.canvas_element[0]

    this.renderer = new Vex.Flow.Renderer(this.canvas, Vex.Flow.Renderer.Backends.CANVAS);
    this.context  = this.renderer.getContext()
    this.stave    = new Vex.Flow.Stave(10, 0, options["width"] - 20)
    this.stave.addClef(clef).setContext(this.context).draw()
  
  draw_notes: (notes)->
    stave_notes = _(notes).map (note)->
      note.duration ||= "q"
      note.keys = _(note.keys).map (key, i)->
        [key, octave] = key.split("/")
        octave ||= "4"
        "#{key}/#{octave}"
      
      stave_note = new Vex.Flow.StaveNote(note)
      _(note.keys).each (key, i)->
        note_portion = key.split("/")[0]
        accidental = note_portion[1..note_portion.length]
        if accidental.length > 0
          stave_note.addAccidental(i, new Vex.Flow.Accidental(accidental))
      stave_note
    
    Vex.Flow.Formatter.FormatAndDraw this.context, this.stave, stave_notes
    

Jazzity.ChordStaff = Jazzity.Staff.extend
  render: ->
    this.draw_stave "treble", width: 170
    this.draw_notes [
      { keys: _(this.model.get("notes")).map (note)-> "#{note}/4" }
    ]

Jazzity.ScaleStaff = Jazzity.Staff.extend
  render: ->
    this.draw_stave "treble", width: 600
    this.draw_notes _(this.model.get("notes")).map (note) ->
      { keys: [note] }

