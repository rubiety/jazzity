//= require comments/comment
//= require comments/comments_view
//= require comments/comment_view

$(document).bind "ready", ->

  $(".comments").each ->
    window.comments_view  = new Jazzity.CommentsView el: $(this)
    window.comments_view.render()

