class Like < ApplicationRecord
  belongs_to :liker, class_name: "User"
  belongs_to :likee, class_name: "User"

  validates :liked, presence: true, if: ->(like) { like.liked.nil? }
  validates :liker, uniqueness: { scope: :likee_id, message: "can't perform a like/unlike to a Likee twice" }

  after_create :check_and_create_match, if: ->(like) { like.liked? }


  private


  def check_and_create_match
    if self.liker.likes_earned.where(liker: self.likee).exists?
      Match.create(matcher: self.liker, matchee: self.likee)
    end
  end
end
