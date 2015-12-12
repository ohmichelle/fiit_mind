class ChartsController < ApplicationController
  def index
    @daily_records = current_user.daily_records
  end

  def weight
    @daily_records = current_user.daily_records
    @daily_records_sorted = DailyRecord.order("daily_records.date DESC").where(:user_id => current_user.id)
  end

  def fullness
    @daily_records = current_user.daily_records
    @meals = Meal.joins(:daily_record).order("daily_records.date DESC").where(:daily_record_id => current_user.daily_records.select(:id))

  end

  def model_history
    @daily_records = current_user.daily_records
    @daily_records_sorted = DailyRecord.order("daily_records.date DESC").where(:user_id => current_user.id)
  end
end
