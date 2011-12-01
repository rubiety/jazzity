//= require comments/models
//= require comments/views
//= require comments/routers

$(document).bind "ready", ->

  $(".comments").each ->
    window.comments_view  = new Jazzity.CommentsView el: $(this)
    window.comments_view.render()

