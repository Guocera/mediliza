class CreateStaff < ActiveRecord::Migration
  def change
    create_table :staff do |t|
      t.string :first_name
      t.string :last_name
      t.integer :position_id
      t.timestamps null: false
    end    
  end
end
