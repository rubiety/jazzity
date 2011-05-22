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
  
  normalize_keys: (keys, starting_octave = 4) ->
    running_index = 0
    last_index = 0

    _(keys).map (key_string, i)->
      [key, octave] = key_string.split("/")
      key_model = Jazzity.Keys.get(key)
      return null unless key_model
      index = key_model.get("index")

      octave ||= (starting_octave + Math.floor((running_index + 1) / 12))

      index_or_plus_12 = if (index < last_index) then (index + 12) else index
      running_index += (index_or_plus_12 - last_index)
      last_index = index

      "#{key}/#{octave}"
  
  draw_notes: (notes)->
    self = this
    stave_notes = _(notes).map (note)->
      note.duration ||= "q"
      note.keys = self.normalize_keys(note.keys)
      
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
      { keys: this.model.get("notes") }
    ]

Jazzity.ScaleStaff = Jazzity.Staff.extend
  render: ->
    this.draw_stave "treble", width: 600
    this.draw_notes _(this.normalize_keys(this.model.get("notes"))).map (note) ->
      { keys: [note] }

Jazzity.ProgressionStaff = Jazzity.Staff.extend
  render: ->
    this.draw_stave "treble", width: 600
    this.draw_notes _(this.model.get("notes")).map (chord) ->
      { keys: chord }
