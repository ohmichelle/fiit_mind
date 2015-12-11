class ChartsController < ApplicationController
  def index
    @daily_records = current_user.daily_records
    @daily_record = DailyRecord.new

    @meals = Meal.where(:daily_record_id => @daily_records.select(:id))
    @meal = Meal.new

    @date = Date.today
  end
end
