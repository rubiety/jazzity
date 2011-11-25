Jazzity.Comment = Backbone.Model.extend
  url: -> "/comments/" + this.id,

Jazzity.Comments = Backbone.Collection.extend
  model: Jazzity.Comment
  url: -> "/comments?#{this.commentable_type}_id=#{this.commentable_id}"
  initialize: (models, options = {})->
    this.commentable_type = options.commentable_type
    this.commentable_id = options.commentable_id
  comparator: (comment)->
    comment.get("votes")
