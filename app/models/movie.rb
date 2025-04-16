class Movie < ApplicationRecord
    has_many :movieGenres, through: :movies_to_movieGenres
    has_many :ratings
end
