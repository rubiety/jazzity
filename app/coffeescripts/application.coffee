$ ->

  $(".chord-staff").each ->
    model = new Jazzity.Chord id: $(this).attr("data-id"), notes: JSON.parse($(this).attr("data-staff-notes"))
    view  = new Jazzity.ChordStaff model: model, el: $(this)
    view.render()

  $(".scale-staff").each ->
    model = new Jazzity.Scale id: $(this).attr("data-id"), notes: JSON.parse($(this).attr("data-staff-notes"))
    view  = new Jazzity.ScaleStaff model: model, el: $(this)
    view.render()

  $(".progression-staff").each ->
    model = new Jazzity.Progression id: $(this).attr("data-id"), notes: JSON.parse($(this).attr("data-staff-notes"))
    view  = new Jazzity.ProgressionStaff model: model, el: $(this)
    view.render()
