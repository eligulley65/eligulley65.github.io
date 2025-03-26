class ChangeColumnInTable < ActiveRecord::Migration[8.0]
  def change
    rename_column :users, :user_id, :backendName

    change_column :users, :backendName, :string
  end
end
