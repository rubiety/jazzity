window.Jazzity or= {}

Jazzity.Staff = Backbone.View.extend
  tagName: "div",
  className: "staff"

  initialize: ->
    this.stave_offset = 0
    this.stave_delta = 80
    this.staves = {}

  draw_canvas: (options = {})->
    this.canvas_width = options["width"] || 170
    this.canvas_height = options["height"] || 120

    this.canvas_element = $("<canvas width='#{this.canvas_width}' height='#{this.canvas_height}'></canvas>")
    this.canvas_element.appendTo(this.el)
    this.canvas = this.canvas_element[0]

    this.renderer = new Vex.Flow.Renderer(this.canvas, Vex.Flow.Renderer.Backends.CANVAS);
    this.context  = this.renderer.getContext()

  draw_stave: (clef = "treble", options = {})->
    this.staves[clef] = new Vex.Flow.Stave(10, this.stave_offset, this.canvas_width - 20)
    this.staves[clef].addClef(clef).setContext(this.context).draw()
    this.stave_offset += this.stave_delta

  draw_notes: (notes)->
    treble_notes = _(notes).map (note)->
      new_note = _.clone(note)
      new_note.duration ||= "h"
      new_note.keys = _(new_note.keys).select (key, i)->
        [note_portion, octave_portion] = key.split("/")
        if parseInt(octave_portion) < 0 then false else true
      new_note.clef = "treble"
      new_note
    
    bass_notes   = _(notes).map (note)->
      new_note = _.clone(note)
      new_note.duration ||= "h"
      new_note.keys = _(new_note.keys).select (key, i)->
        [note_portion, octave_portion] = key.split("/")
        if parseInt(octave_portion) < 0 then true else false
      new_note.clef = "bass"
      new_note

    treble_notes = _(treble_notes).reject (note)-> note.keys.length == 0
    bass_notes   = _(bass_notes).reject (note)-> note.keys.length == 0

    mc = new Vex.Flow.ModifierContext()
    treble_stave_notes = this.build_stave_notes(treble_notes, mc)
    bass_stave_notes = this.build_stave_notes(bass_notes, mc)

    this.draw_notes_on_stave treble_stave_notes, "treble" if this.staves["treble"] and treble_notes.length > 0
    this.draw_notes_on_stave bass_stave_notes, "bass" if this.staves["bass"] and bass_notes.length > 0

  draw_notes_on_stave: (stave_notes, clef = "treble")->
    Vex.Flow.Formatter.FormatAndDraw this.context, this.staves[clef], stave_notes

  build_stave_notes: (notes, mc)->
    _(notes).map (note)->
      note.duration ||= "h"
      
      stave_note = new Vex.Flow.StaveNote(note)
      stave_note.addToModifierContext(mc) if mc

      _(note.keys).each (key, i)->
        note_portion = key.split("/")[0]
        accidental = note_portion[1..note_portion.length]
        stave_note.addAccidental(i, new Vex.Flow.Accidental(accidental)) if accidental.length > 0
      stave_note
    

Jazzity.ChordStaff = Jazzity.Staff.extend
  render: ->
    this.draw_canvas()
    this.draw_stave "treble", width: 170
    this.draw_notes [
      { keys: this.model.get("notes") }
    ]

Jazzity.VoicingStaff = Jazzity.Staff.extend
  render: ->
    this.draw_canvas(height: 235)
    this.draw_stave "treble", width: 170
    this.draw_stave "bass", width: 170
    this.draw_notes [
      { keys: this.model.get("notes") }
    ]

Jazzity.ScaleStaff = Jazzity.Staff.extend
  render: ->
    this.draw_canvas(width: 600)
    this.draw_stave "treble"
    this.draw_notes _(this.model.get("notes")).map (note) ->
      { keys: [note] }

Jazzity.ProgressionStaff = Jazzity.Staff.extend
  render: ->
    this.draw_canvas(width: 600)
    this.draw_stave "treble"
    this.draw_notes _(this.model.get("notes")).map (chord) ->
      { keys: chord }

