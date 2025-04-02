class Movie_to_genre < ApplicationRecord
	belongs_to :movieGenres
    belongs_to :movies
end