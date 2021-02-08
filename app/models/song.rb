class Song < ApplicationRecord
    validates :title, :content, presence: true
end
