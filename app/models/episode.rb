class Episode < ApplicationRecord
  belongs_to :serie

  def self.check_dislikes(user_id)
    self.dislikes.delete(user_id) if self.dislikes.include?(user_id)
  end

  def self.check_likes(user_id)
    self.likes.delete(user_id) if self.likes.include?(user_id)
  end
end
