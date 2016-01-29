class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.belongs_to :volunteer
      t.belongs_to :patient, index: true
      t.string :observation
      t.integer :walking_duration
      t.string :beverage
      t.datetime :time
      t.timestamps null: false
    end
  end
end
