class AddStatsToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :stats, :text
  end
end
