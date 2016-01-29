class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.integer :position_id
      t.timestamps null: false
    end    
  end
end
