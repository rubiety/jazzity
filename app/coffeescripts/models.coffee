$ ->
  Jazzity.Chord = Backbone.Model.extend url: -> "/chords/" + this.id
  Jazzity.Scale = Backbone.Model.extend url: -> "/scales/" + this.id
  Jazzity.Progression = Backbone.Model.extend url: -> "/progressions/" + this.id
