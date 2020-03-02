class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  cattr_reader :current_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :replies
  has_many :bookmarks, dependent: :destroy
  has_many :ratings, dependent: :destroy

  has_many :premium_purchases

  def is_premium?
    premium_purchases.active.exists?
  end

  def active_premium
    premium_purchases.active.first
  end

  def update_with_password(user_profile_params)
    current_password = user_profile_params.delete(:current_password)
    if current_password == ''
      user_profile_params.delete(:password)
      self.update(user_profile_params)
      true

    elsif self.valid_password?(current_password)
      self.update(user_profile_params)
      true
    else
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end
  end
end
