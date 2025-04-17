class Show < ApplicationRecord
    has_many :shows_to_show_genres
    has_many :show_genres, through: :shows_to_show_genres
    has_many :show_ratings
end
