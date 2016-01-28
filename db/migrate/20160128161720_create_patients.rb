class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.belongs_to :staff, index: true
      t.string :beverage_type
      t.string :mobility_type
      t.string :language
      t.timestamps null: false
    end
  end
end
