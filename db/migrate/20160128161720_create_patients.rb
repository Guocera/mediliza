class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :nick_name
      t.belongs_to :staff, index: true
      t.string :beverage_type
      t.string :mobility_type
      t.integer :family_code, limit: 8
      t.string :language
      t.string :request
      t.timestamps null: false
    end
  end
end
