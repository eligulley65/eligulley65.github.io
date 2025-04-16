class MovieGenre < ApplicationRecord
    has_many :movies_to_movie_genres
    has_many :movies, through: :movies_to_movie_genres
end
