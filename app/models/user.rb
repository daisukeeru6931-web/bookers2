class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :books, dependent: :destroy
  has_one_attached :profile_image

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
  validates :email_address, presence: true, uniqueness: true

  def get_profile_image
    profile_image.attached? ? profile_image : "no_image.webp"
  end
end