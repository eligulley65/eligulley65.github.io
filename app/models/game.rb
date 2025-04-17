class Game < ApplicationRecord
    has_many :ratings
    has_many :games_to_game_genres
    has_many :game_genres, through: :games_to_game_genres
end