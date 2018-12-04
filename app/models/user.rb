class User < ApplicationRecord
  acts_as_token_authenticatable
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :photos
  has_many :likes_given, class_name: "Like", foreign_key: "liker_id"
  has_many :likes_earned, class_name: "Like", foreign_key: "likee_id"
  

  def default_photo
    self.photos.where(default: true).take
  end

  
  def matches
    Match.where('matcher_id = :user OR matchee_id = :user', user: self.id)
  end
end
