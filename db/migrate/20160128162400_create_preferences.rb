class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.belongs_to :patient, index: true
      t.string :description
      t.boolean :likes
      t.timestamps null: false
    end
  end
end
