$ ->

  $(".chord-staff").each ->
    model = new Jazzity.Chord id: $(this).attr("data-id"), notes: JSON.parse($(this).attr("data-notes"))
    view  = new Jazzity.ChordStaff model: model, el: $(this)
    view.render()

  $(".scale-staff").each ->
    model = new Jazzity.Scale id: $(this).attr("data-id"), notes: JSON.parse($(this).attr("data-notes"))
    view  = new Jazzity.ScaleStaff model: model, el: $(this)
    view.render()
