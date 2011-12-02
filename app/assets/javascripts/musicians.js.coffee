$(document).bind "ready", ->
  return unless $("body.musicians")
  
  $("article.musician a.like").click (e)->
    return false if $(e.target).hasClass("liked")

  $("article.musician a.like").bind "ajax:success", (e)->
    $(e.target).addClass("liked").attr("title", "You like this musician")

