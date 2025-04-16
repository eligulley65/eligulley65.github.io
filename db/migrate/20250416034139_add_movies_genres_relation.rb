class AddMoviesGenresRelation < ActiveRecord::Migration[8.0]
  def change
    create_table :movies_to_movieGenres do |t|
      t.references :movies, null: false, foreign_key: true
      t.references :movieGenres, null: false, foreign_key: true
    end
  end
end
