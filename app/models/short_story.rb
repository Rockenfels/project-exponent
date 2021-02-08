class ShortStory < ApplicationRecord
    validates :title, :content, presence: true
end
