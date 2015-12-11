class DailyRecordsController < ApplicationController
  def index
    @daily_records = current_user.daily_records
    @daily_record = DailyRecord.new

    @meals = Meal.where(:daily_record_id => @daily_records.select(:id))
    @meal = Meal.new

    @date = Date.today
  end

  def show
    @daily_record = DailyRecord.find(params[:id])
  end

  def new
    @daily_record = DailyRecord.new
  end

  def create
    @daily_record = DailyRecord.new
    @daily_record.weight_loss_probability = params[:weight_loss_probability]
    @daily_record.average_fullness = params[:average_fullness]
    @daily_record.date = params[:date]
    @daily_record.user_id = params[:user_id]
    @daily_record.weight = params[:weight]

    if @daily_record.save
      redirect_to "/daily_records", :notice => "Daily record created successfully."
    else
      render 'new'
    end
  end

  def edit
    @daily_record = DailyRecord.find(params[:id])
  end

  def update
    @daily_record = DailyRecord.find(params[:id])

    @daily_record.weight_loss_probability = params[:weight_loss_probability]
    @daily_record.average_fullness = params[:average_fullness]
    @daily_record.date = params[:date]
    @daily_record.user_id = params[:user_id]
    @daily_record.weight = params[:weight]

    if @daily_record.save
      redirect_to "/daily_records", :notice => "Daily record updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @daily_record = DailyRecord.find(params[:id])

    @daily_record.destroy

    redirect_to "/daily_records", :notice => "Daily record deleted."
  end
end
