$(document).bind "ready", ->
  return unless $("body.tunes")
  
  $("article.tune a.like").click (e)->
    return false if $(e.target).hasClass("liked")

  $("article.tune a.like").bind "ajax:success", (e)->
    $(e.target).addClass("liked").attr("title", "You like this tune")

