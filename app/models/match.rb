class Match < ApplicationRecord
  self.per_page = 10
  
  belongs_to :matcher, class_name: "User"
  belongs_to :matchee, class_name: "User"
  has_many :messages
  
  validates_with MatchWithSameUsersValidator

  after_create :notify_users


  def notify_users
    MatchNotificationJob.perform_later(self)
  end
end
