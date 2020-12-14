class AddNewoneToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :score, :integer, default: 0
  end
end
