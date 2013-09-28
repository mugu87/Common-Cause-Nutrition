class AddOrganizationIdToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :Organization_ID, :integer
  end
end
