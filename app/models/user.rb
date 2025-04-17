class User < ApplicationRecord
	has_many :game_ratings
	has_many :show_ratings
	has_many :movie_ratings
	has_many :recommendations
end
