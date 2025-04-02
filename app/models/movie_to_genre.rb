class MovieToGenre < ApplicationRecord
	belongs_to :movieGenres
    belongs_to :movies
end