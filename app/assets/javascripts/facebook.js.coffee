$(document).bind "ready", ->

  $("a.invite-facebook-friends").click ->
    FB.init({
      appId: $(this).data("app-id"),
      cookie: true,
      status: true,
      xfbml : true,
      oauth : true
    })

    FB.ui({ method: "apprequests", message: "Wants you to join Jazzity, the jazz knowledge engine!"})
    false
