class CreateRatings < ActiveRecord::Migration[8.0]
  def change
    create_table :ratings do |t|
      t.integer :score
      t.integer :user_id

      t.timestamps
    end
  end
end
