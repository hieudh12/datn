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

  validates :username, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true, allow_nil: true

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

  def generate_password_token
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end
  
  def password_token_valid?
    (self.reset_password_sent_at + 4.hours) > Time.now.utc
  end
  
  def reset_password(password, password_confirmation)
    if (password == password_confirmation)
      self.reset_password_token = nil
      self.password = password
      save!
    end
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end
end
