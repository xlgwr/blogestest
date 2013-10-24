class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  def self.from_users_followed_by(user)
#    followed_users_ids=user.followed_users_ids
#    where("user_id IN (?) OR user_id=?",followed_users_ids,user)
#    where("user_id IN (:followed_user_ids) OR user_id= :user_id",
#          followed_users_ids: followed_users_ids,user_id: user)
    followed_users_ids = "Select followed_id From relationships
                          Where follower_id = :user_id"
    where("user_id IN (#{followed_users_ids}) OR user_id= :user_id",
          user_id: user.id)
  end
end
