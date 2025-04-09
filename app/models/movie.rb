class Movie < ApplicationRecord
    has_many :movies_to_movieGenres
    has_many :ratings
end