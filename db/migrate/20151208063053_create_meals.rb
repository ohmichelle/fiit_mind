class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :position
      t.float :fullness_score
      t.text :description
      t.integer :daily_record_id

      t.timestamps

    end
  end
end
