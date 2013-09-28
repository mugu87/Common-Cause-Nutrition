class CreateStUsers < ActiveRecord::Migration
  def change
    create_table :st_users do |t|
      t.string :name
      t.integer :height
      t.integer :weight
      t.string :sex
      t.integer :total_calorie_in
      t.integer :total_calorie_out

      t.timestamps
    end
  end
end
