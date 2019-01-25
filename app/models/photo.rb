class Photo < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  after_create :check_user_default_photo
  after_update :set_others_as_non_default, if: ->(photo) { photo.default? }
  
  def default!
    transaction do
      set_others_as_non_default
      self.update(default: true)
    end
  end


  private


  def set_others_as_non_default
    self.user.photos.where.not(id: self.id).update_all(default: false)
  end


  def check_user_default_photo
    unless self.user.photos.where(default: true).exists?
      default!
    end
  end
end
