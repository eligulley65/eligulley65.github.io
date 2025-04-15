class Moviegenre < ApplicationRecord
    has_many :movies_to_genres
end
