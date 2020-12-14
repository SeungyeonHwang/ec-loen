class ChangeRatingToBeIntegerInCosmeticsTry < ActiveRecord::Migration[5.2]
  def change
    change_column :cosmetics, :rating, 'integer USING CAST(rating AS integer)'
  end
end
