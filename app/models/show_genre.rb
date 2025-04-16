class ShowGenre < ApplicationRecord
    has_many :shows_to_show_genres
    has_many :shows, through: :shows_to_show_genres
end