class Movie < ApplicationRecord
    has_many :movies_to_movieGenres
end