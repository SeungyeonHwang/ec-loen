class ChangeRatingToBeIntegerInCosmetics < ActiveRecord::Migration[5.2]
  def change
    change_column :cosmetics, :rating, :integer
  end
end
