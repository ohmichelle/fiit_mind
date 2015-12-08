class CreateWeightLossModels < ActiveRecord::Migration
  def change
    create_table :weight_loss_models do |t|
      t.float :coefficient_fullness
      t.float :intercept
      t.integer :model_version
      t.date :model_end_date
      t.date :model_start_date
      t.integer :user_id

      t.timestamps

    end
  end
end
