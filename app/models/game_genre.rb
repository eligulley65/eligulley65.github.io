class GameGenre < ApplicationRecord
    has_many :games_to_game_genres
    has_many :games, through: :games_to_game_genres
end
