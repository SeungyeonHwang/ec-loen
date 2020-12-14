class ChangeRatingToBeIntegerInCosmeticsTry < ActiveRecord::Migration[5.2]
  def change
    change_column :cosmetics, :rating, 'integer USING CAST(column_name AS integer)'
  end
end
