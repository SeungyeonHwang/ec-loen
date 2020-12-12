class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.references :cosmetic, foreign_key: true
      t.string :title
      t.text :contents

      t.timestamps
    end
  end
end
