class User < ApplicationRecord
  acts_as_token_authenticatable
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :photos
  has_many :likes_given, class_name: "Like", foreign_key: "liker_id"
  has_many :likes_earned, class_name: "Like", foreign_key: "likee_id"
end
