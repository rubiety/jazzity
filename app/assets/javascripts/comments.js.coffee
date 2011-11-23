//= require comments/models
//= require comments/views
//= require comments/routers

$(document).bind "ready", ->

  $(".comments").each ->
    view  = new Jazzity.CommentsView el: $(this)
    view.render

