module LikesHelper
  def like?(object)
    return false unless current_musician

    case object
    when Tune
      current_musician.tune_ids.include?(object.id)
    when Musician
      current_musician.favorite_musician_ids.include?(object.id)
    end
  end

  def like_tune_link(tune)
    link_to image_tag("thumbs_up.png"), musicians_tunes_path(:tune_id => tune.id), 
      :method => :post, 
      "data-type" => "json",
      :remote => true, 
      :class => "like #{'liked' if like?(tune)}", 
      :title => "I like this tune"
  end

end
