module LikesHelper
  def like?(object)
    return false unless current_musician
    current_musician.likes.where(:likeable_id => object.id, :likeable_type => object.class.name).exists?
  end

  def like_link(object)
    link_to image_tag("thumbs_up.png"), musicians_likes_path(:likeable_id => object.id, :likeable_type => object.class.name),
      :method => :post,
      "data-type" => "json",
      :remote => true,
      :class => "like #{'liked' if like?(object)}",
      :title => "I like this"
  end

end
