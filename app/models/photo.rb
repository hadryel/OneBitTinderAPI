class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  after_create :check_user_default_photo
  
  def default!
    transaction do
      self.user.photos.where.not(id: self.id).update(default: false)
      self.update(default: true)
    end
  end


  private


  def check_user_default_photo
    unless self.user.photos.where(default: true).exists?
      default!
    end
  end
end
