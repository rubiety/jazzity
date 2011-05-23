window.Jazzity or= {}

Jazzity.Key = Backbone.Model.extend url: -> "/keys/" + this.id
Jazzity.Tune = Backbone.Model.extend url: -> "/tunes/" + this.id
Jazzity.Musician = Backbone.Model.extend url: -> "/musicians/" + this.id
Jazzity.Chord = Backbone.Model.extend url: -> "/chords/" + this.id
Jazzity.Voicing = Backbone.Model.extend url: -> "/voicings/" + this.id
Jazzity.Progression = Backbone.Model.extend url: -> "/progressions/" + this.id
Jazzity.Scale = Backbone.Model.extend url: -> "/scales/" + this.id
Jazzity.NoteSeqquence = Backbone.Model.extend url: -> "/notes/" + this.id
Jazzity.ChordSequence = Backbone.Model.extend url: -> "/chord-sequences/" + this.id

Jazzity.KeyCollection = Backbone.Collection.extend model: Jazzity.Key
