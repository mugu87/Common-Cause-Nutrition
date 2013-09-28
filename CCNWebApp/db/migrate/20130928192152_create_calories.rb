class CreateCalories < ActiveRecord::Migration
  def change
    create_table :calories do |t|
      t.integer :intake
      t.integer :outtake

      t.timestamps
    end
  end
end
