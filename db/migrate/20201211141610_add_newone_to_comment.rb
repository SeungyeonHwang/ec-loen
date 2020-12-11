class AddNewoneToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :score, :inteager, default: 0
  end
end
