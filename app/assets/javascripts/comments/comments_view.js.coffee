Jazzity.CommentsView = Backbone.View.extend
  events:
    "click a.add-comment": "show_comment_form"
    "click a.cancel-add-comment": "hide_comment_form"
    "submit form.create-comment-form": "create_comment"

  initialize: ->
    this.commentable_type = this.el.attr("data-commentable-type")
    this.commentable_id = this.el.attr("data-commentable-id")

    this.collection ||= new Jazzity.Comments {}
    this.collection.commentable_type = this.commentable_type
    this.collection.commentable_id = this.commentable_id
    this.collection.bind "add", this.add, this
    this.collection.bind "reset", this.reset, this
    this.collection.bind "all", this.render_overview, this

  render: ->
    this.$("form.create-comment-form textarea").autoResize()
    this.$(".comments-spinner").show()
    $(this.el).children("ul.comments-list").empty()
    this.collection.fetch()
    this.render_overview()
    this
  
  render_overview: ->
    this

  show_comment_form: (e)->
    this.$("form.create-comment-form").slideDown()
    this.$("a.add-comment").hide()
    false

  hide_comment_form: (e)->
    this.$("form.create-comment-form").slideUp()
    this.$("a.add-comment").show()
    false

  add: (comment)->
    view = new Jazzity.CommentView model: comment, comments_view: this
    $(view.render().el).prependTo($(this.el).children("ul.comments-list")).effect("highlight")
    this.$(".no-comments").hide()

  reset: ->
    self = this

    if this.collection.isEmpty()
      this.$(".no-comments").show()
    else
      this.$(".no-comments").hide()
      this.collection.each (comment)->
        view = new Jazzity.CommentView model: comment, comments_view: self
        $(view.render().el).appendTo($(self.el).children("ul.comments-list"))

    this.$(".comments-spinner").hide()
    this

  create_comment: (e)->
    this.collection.create { subject: $(e.target).find("input[type=text]").val(), content: $(e.target).find("textarea").val() },
      success: ->
        this.$("form.create-comment-form").find("input[type=text], textarea").val("");
        $(this.el).effect("highlight")

    this.$("form.create-comment-form").hide()
    this.$("a.add-comment").show()
    false


