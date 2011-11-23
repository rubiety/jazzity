$(document).bind "ready", ->
  
  $("input[data-autocomplete]").each (e)->
    e = $(this)
    e.autocomplete
      source: (request, response)->
        $.getJSON e.attr("data-autocomplete"), { q: request.term }, (data)->
          response.call null, _(data).map (i)-> i.name

