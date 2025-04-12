class Rating < ApplicationRecord
	belongs_to :user
	belongs_to :movie
	belongs_to :game
end
