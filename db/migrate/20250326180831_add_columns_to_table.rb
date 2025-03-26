class AddColumnsToTable < ActiveRecord::Migration[8.0]
  def change
    change_table :users do |t|
      t.integer :user_id
      t.string :email
      t.datetime :dateOfBirth
    end

    # Add multiple columns to the 'orders' table
    change_table :ratings do |t|
      t.string :mediaType
      t.string :media_id
    end
  end
end
