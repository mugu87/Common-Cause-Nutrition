class AddAmountToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :amount, :decimal
  end
end
