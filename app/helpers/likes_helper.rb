module LikesHelper

  def likes_count(entity)
    entity.likes.liked - entity.likes.disliked
  end
end