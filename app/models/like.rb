class Like < ApplicationRecord
  belongs_to :liker, class_name: "User"
  belongs_to :likee, class_name: "User"

  validates :liked, presence: true
  validates :liker, uniqueness: { scope: :likee_id, message: "can't perform a like/unlike to a Likee twice" }

  after_create :notify_match, if: ->(like) { like.liked? }


  private


  def notify_match
    if self.liker.likes_earned.where(liker: self.likee).exists?
      MatchNotificationJob.perform_later(self)
    end
  end
end
