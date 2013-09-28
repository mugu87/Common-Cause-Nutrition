class CreateStUsers < ActiveRecord::Migration
  def change
    create_table :st_users do |t|

      t.timestamps
    end
  end
end
