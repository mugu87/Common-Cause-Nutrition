class AddHightToUser < ActiveRecord::Migration
  def change
    add_column :users, :Height, :Integer
  end
end
