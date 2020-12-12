class AddNewoneToCosmetic < ActiveRecord::Migration[5.2]
  def change
    add_column :cosmetics, :rating, :string
    add_column :cosmetics, :count, :integer, default: 0
  end
end
