window.Jazzity or= {}

Jazzity.Staff = Backbone.View.extend
  tagName: "div",
  className: "staff"
  draw_stave: (clef = "treble")->
    this.canvas_element = $("<canvas width='170' height='120'></canvas>")
    this.canvas_element.appendTo(this.el)
    this.canvas = this.canvas_element[0]

    this.renderer = new Vex.Flow.Renderer(this.canvas, Vex.Flow.Renderer.Backends.CANVAS);
    this.context  = this.renderer.getContext()
    this.stave    = new Vex.Flow.Stave(10, 0, 150)
    this.stave.addClef(clef).setContext(this.context).draw()
  draw_notes: (notes)->
    stave_notes = _(notes).map (note)->
      note.duration ||= "q"
      stave_note = new Vex.Flow.StaveNote(note)
      
      _(note.keys).each (key, i)->
        note_portion = key.split("/")[0]
        console.log "Note Portion: #{note_portion} from #{key}"
        accidental = note_portion[1..note_portion.length]
        if accidental.length > 0
          console.log "Adding Accidental #{i} #{accidental}"
          stave_note.addAccidental(i, new Vex.Flow.Accidental(accidental))

      stave_note
    
    Vex.Flow.Formatter.FormatAndDraw this.context, this.stave, stave_notes
    

Jazzity.ChordStaff = Jazzity.Staff.extend
  render: ->
    this.draw_stave "treble"
    this.draw_notes [
      { keys: _(this.model.get("notes")).map (note)-> "#{note}/4" }
    ]
    

Jazzity.ScaleStaff = Jazzity.Staff.extend
  render: ->
    alert("Rendering Scale Staff")
  
