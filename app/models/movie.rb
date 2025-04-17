class Movie < ApplicationRecord
    has_many :movies_to_movie_genres
    has_many :movie_genres, through: :movies_to_movie_genres
    has_many :movie_ratings
end
