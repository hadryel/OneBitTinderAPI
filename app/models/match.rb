class Match < ApplicationRecord
  belongs_to :matcher, class_name: "User"
  belongs_to :matchee, class_name: "User"
  has_many :messages, dependent: :delete_all
  
  validates_with MatchWithSameUsersValidator

  after_create :notify_users


  def notify_users
    MatchNotificationJob.perform_now(self)
  end
end
