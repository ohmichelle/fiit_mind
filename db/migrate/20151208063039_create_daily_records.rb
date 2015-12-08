class CreateDailyRecords < ActiveRecord::Migration
  def change
    create_table :daily_records do |t|
      t.float :weight_loss_probability
      t.float :average_fullness
      t.date :date
      t.integer :user_id
      t.float :weight

      t.timestamps

    end
  end
end
