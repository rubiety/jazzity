_.extend window.Jazzity, {

  Chord: Backbone.Model.extend
    url: -> "/chords/" + this.id

  Scale: Backbone.Model.extend
    url: -> "/scales/" + this.id

  Progression: Backbone.Model.extend
    url: -> "/progressions/" + this.id

}
