class Recipe < ApplicationRecord
    mount_uploader :image, RecipeImageUploader

    scope :premium, -> { where(is_premium: true) }
    scope :common, -> { where(is_premium: false) }

    belongs_to :category
    has_many :ingredients, dependent: :destroy

    has_many :comments, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    has_many :ratings, dependent: :destroy

    paginates_per 6

    def get_average_rating
        return self.ratings.average(:rate)
    end
    
    def get_rate_times
        return self.ratings.count(:user_id)
    end
end
