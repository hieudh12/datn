class PremiumPurchase < ApplicationRecord
  scope :active, -> { where("expries_at >= ?", Time.now) }

  belongs_to :user

  PERIOD_DEFAULT = 30
end
