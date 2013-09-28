class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :location
      t.text :discription

      t.timestamps
    end
  end
end
