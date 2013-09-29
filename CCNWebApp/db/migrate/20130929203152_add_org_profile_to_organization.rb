class AddOrgProfileToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :org_profile, :text
  end
end
