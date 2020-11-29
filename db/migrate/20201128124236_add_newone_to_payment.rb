class AddNewoneToPayment < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :merchant_id, :string
    add_column :payments, :payer_id, :string
  end
end
