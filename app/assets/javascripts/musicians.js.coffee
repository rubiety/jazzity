$(document).bind "ready", ->
  return unless $("body.musicians")
  
  $("#search select#show").change ->
    if $(this).val() == "musicians"
      $("#search #location-container").hide()
    else
      $("#search #location-container").show()
