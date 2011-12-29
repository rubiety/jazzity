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
    $(this.el).addClass("root") unless this.model.get("parent_id")
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
      $(this.el).find("textarea").autoResize()
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

