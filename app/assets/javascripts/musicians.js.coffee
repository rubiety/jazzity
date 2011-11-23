$(document).bind "ready", ->
  
  if $("body.profiles")
    $("form#update-profile-form.disabled").find("input, textarea").attr("disabled", true)

    $("a#create-profile").click ->
      $("form#update-profile-form").removeClass("disabled").find("input, textarea").removeAttr("disabled")
      $(this).remove
      false

