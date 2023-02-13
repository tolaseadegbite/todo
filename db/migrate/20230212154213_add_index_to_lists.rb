class AddIndexToLists < ActiveRecord::Migration[7.0]
  def change
    add_index :lists, [:user_id, :created_at]
  end
end
