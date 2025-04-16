class Moviegenre < ApplicationRecord
    has_many :movies, through: :movies_to_movieGenres
end
