class EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :name, :likes, :dislikes

  def likes
    object.likes.blank? ? 0 : object.likes.size
  end

  def dislikes
    object.dislikes.blank? ? 0 : object.dislikes.size
  end
end
