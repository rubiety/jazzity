Jazzity.CommentsView = Backbone.View.extend
  events:
    "click a.add-comment": "show_comment_form",
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
    this.$("#comments-spinner").show()
    $(this.el).children("ul.comments-list").empty()
    this.collection.fetch()
    this.render_overview()
    this
  
  render_overview: ->
    this

  show_comment_form: (e)->
    this.$("form.create-comment-form").slideDown()
    $(e.target).remove()
    false

  add: (comment)->
    view = new Jazzity.CommentView model: comment, comments_view: this
    $(view.render().el).appendTo($(this.el).children("ul.comments-list")).effect("highlight")

  reset: ->
    self = this
    this.collection.each (comment)->
      view = new Jazzity.CommentView model: comment, comments_view: self
      $(view.render().el).appendTo($(self.el).children("ul.comments-list"))

    this.$("#comments-spinner").hide()
    this

  create_comment: (e)->
    this.collection.create { content: $(e.target).find("textarea").val() },
      success: ->
        this.$('form.create-comment-form').find("input[type=text], textarea").val("");
        $(this.el).effect("highlight")
    false


Jazzity.CommentView = Backbone.View.extend
  tagName: "li"
  className: "comment"

  events:
    "click a.reply" : "reply"
    "click a.edit" : "edit"
    "click a.remove" : "remove"
    "submit form.reply-form": "create_reply"
    "submit form.edit-form": "update"

  initialize: ->
    this.comments_view = this.options["comments_view"]
    this.parent_comment_view = this.options["parent_comment_view"]
    this.template = _.template($('#comment-template').html())

    this.model.bind "change", this.render, this
    this.model.bind "destroy", this.destroy, this
    this.model.children.bind "add", this.add_child, this
    this.model.children.bind "reset", this.reset_children, this
    this.model.children.bind "all", this.comments_view.render_overview, this.comments_view

  render: ->
    $(this.el).attr("data-id", this.model.get("id"))
    $(this.el).html this.template(this.model.toJSON())
    $(this.el).find(".staff").vexflow()
    this.reset_actions()
    this.reset_children()
    this

  reset_actions: ->
    if Jazzity.signed_in()
      this.$("div.actions").find("a.reply").show()
      this.$("div.actions").find("a.edit, a.remove").show() if Jazzity.current_musician_id() == this.model.get("author_id")

  add_child: (comment)->
    view = new Jazzity.CommentView model: comment, parent_commentjview: this, comments_view: this.comments_view
    $(view.render().el).appendTo($(this.el).children("ul.comments-list")).effect("highlight")

  reset_children: ->
    self = this
    this.model.children.each (comment)->
      view = new Jazzity.CommentView model: comment, parent_comment_view: self, comments_view: self.comments_view
      $(view.render().el).appendTo($(self.el).children("ul.comments-list"))
    this

  reply: (e)->
    if (this.$("form.reply-form").length > 0)
      this.$("form.reply-form").remove()
    else
      $(this.el).append _.template($("#reply-template").html())
    false

  create_reply: (e)->
    this.model.children.create content: $(e.target).find("textarea").val()
    this.$('form.reply-form').remove()
    false

  edit: ->
    if (this.$("form.edit-form").length > 0)
      this.$("form.edit-form").remove()
      this.$("> div.content").html(this.model.get("content"))
    else
      this.$("> div.content").html("")
      this.$("> div.content").append _.template($("#edit-template").html())
      this.$("> div.content form.edit-form textarea").val(this.model.get("content"))
    false

  update: (e)->
    this.model.save { content: $(e.target).find("textarea").val() },
      succcess: ->
        this.$("form.edit-form").remove()
        this.$("> div.content").html(this.model.get("content"))
        $(this.el).effect("highlight")
    false

  destroy: ->
    $(this.el).remove()

  remove: ->
    this.model.destroy()
    false

