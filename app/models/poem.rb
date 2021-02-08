class Poem < ApplicationRecord
    validates :title, :content, presence: true
end
