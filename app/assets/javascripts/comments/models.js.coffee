Jazzity.Comment = Backbone.Model.extend
  defaults:
    children_attributes: []

  url: ->
    base = this.collection.url()
    return base if this.isNew()
    [main, query] = base.split("?")
    "#{main}/#{encodeURIComponent(this.id)}?#{query}"

  initialize: ->
    this.set_children()
    this.bind "change:children_attributes", this.set_children, this
    this.bind "change:id", this.set_children, this

  created_at_in_words: ->
    moment(this.get("created_at")).fromNow()

  set_children: ->
    this.children = new Jazzity.Comments (this.get("children_attributes") || {}), 
      commentable_type: this.collection.commentable_type
      commentable_id: this.collection.commentable_id
      parent_id: this.get("id")
    this.children.each (e)->
      e.set_children()

  toJSON: ->
    json = this.attributes
    json.created_at_in_words = this.created_at_in_words()
    json.children_attributes = this.children.toJSON()
    json

Jazzity.Comments = Backbone.Collection.extend
  model: Jazzity.Comment
  url: -> "/comments?#{this.commentable_type}_id=#{this.commentable_id}&parent_id=#{this.parent_id || ''}"
  initialize: (models, options = {})->
    this.commentable_type = options.commentable_type
    this.commentable_id = options.commentable_id
    this.parent_id = options.parent_id
    
