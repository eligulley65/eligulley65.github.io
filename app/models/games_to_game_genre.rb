class GamesToGameGenre < ApplicationRecord
    belongs_to :game
    belongs_to :game_genre
  end