class ChangeRatingToBeIntegerInCosmetics < ActiveRecord::Migration[5.2]
  def up
    change_column :cosmetics, :rating, 'integer USING CAST(rating AS integer)'
  end
end

