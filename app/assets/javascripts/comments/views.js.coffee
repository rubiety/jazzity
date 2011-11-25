Jazzity.CommentsView = Backbone.View.extend
  events:
    "ajax:before form#create-comment-form": "create_comment_before"
    "ajax:success form#create-comment-form": "create_comment_success"
    "ajax:error from#create-comment-form": "create_comment_error"
    "ajax:complete from#create-comment-form": "create_comment_complete"

  initialize: ->
    this.commentable_type = this.el.attr("data-commentable-type")
    this.commentable_id = this.el.attr("data-commentable-id")
    this.comments = new Jazzity.Comments {}, { commentable_type: this.commentable_type, commentable_id: this.commentable_id }
    this.comments.bind "add", this.add, this
    this.comments.bind "reset", this.reset, this
    this.comments.bind "all", this.render_overview, this

  render: ->
    this.$("ul.comments-list").empty()
    this.comments.fetch()
    this.render_overview()
    this
  
  render_overview: ->

  add: (comment)->
    view = new Jazzity.CommentView model: comment
    $(view.render().el).appendTo(this.$("ul.comments-list")).effect("highlight")

  reset: ->
    this.comments.each (comment)->
      view = new Jazzity.CommentView model: comment
      $(view.render().el).appendTo(this.$("ul.comments-list"))

  create_comment_before: (e)->
    $(e.target).append("<input type='hidden' name='#{this.commentable_type}_id' value='#{this.commentable_id}' />")

  create_comment_success: (e, data, status, xhr)->
    this.comments.add(data)

  create_comment_error: (e, xhr, status, error)->
    alert "An error has occurred attempting to save your comment."

  create_comment_complete: (e)->
    $(e.target).find("input[name='#{this.commentable_type}_id']").remove()


Jazzity.CommentView = Backbone.View.extend
  events:
    "click a.edit" : "edit"
    "click a.remove" : "destroy"

  initialize: ->
    this.template = _.template($('#comment-template').html())
    this.model.bind "change", this.render, this
    this.model.bind "destroy", this.remove, this

  render: ->
    $(this.el).html this.template(this.model.toJSON())
    this

  edit: ->

  destroy: ->
    this.model.destroy()

  remove: ->
    $(this.el).remove()


