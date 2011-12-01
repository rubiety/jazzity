window.Jazzity or= {}

Jazzity.signed_in = ->
  $("header#header aside[data-current-musician-id]").length > 0
Jazzity.current_musician_id = ->
  parseInt($("header#header aside[data-current-musician-id]").attr("data-current-musician-id"))
