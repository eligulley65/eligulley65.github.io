class ShowsToShowGenre < ApplicationRecord
    belongs_to :show
    belongs_to :show_genre
end