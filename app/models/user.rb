class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_one_attached :avatar
  validate :acceptable_avatar

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  def display_avatar
    avatar.variant(resize_to_limit: [100, 100])
  end

  private
  def acceptable_avatar
    unless avatar.attached?
      errors.add(:avatar, "can't be blank")
      return
    end

    unless avatar.byte_size <= 1.megabyte
      errors.add(:avatar, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(avatar.content_type)
      errors.add(:avatar, "must be a JPEG or PNG")
    end
  end
end
