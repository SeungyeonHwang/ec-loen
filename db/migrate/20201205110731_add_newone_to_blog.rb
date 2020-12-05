class AddNewoneToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :tag, :string
  end
end
