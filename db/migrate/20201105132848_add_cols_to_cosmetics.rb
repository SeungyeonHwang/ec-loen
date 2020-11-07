class AddColsToCosmetics < ActiveRecord::Migration[5.2]
  def change
    add_column :cosmetics, :price, :decimal
    add_column :cosmetics, :is_open, :boolean, :default => true
  end
end
