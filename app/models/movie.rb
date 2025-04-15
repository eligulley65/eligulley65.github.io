class Movie < ApplicationRecord
    has_many :movies_to_genres
    has_many :ratings
end
