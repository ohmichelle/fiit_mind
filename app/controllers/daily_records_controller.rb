class DailyRecordsController < ApplicationController
  def index
    @daily_records = current_user.daily_records.where(:date => Date.today)
    @daily_record = DailyRecord.new

    @meals = Meal.joins(:daily_record).order("daily_records.date DESC").where(:daily_record_id => @daily_records.select(:id))
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
    if current_user.daily_records.find_by(:date => params[:date])
      @daily_record = DailyRecord.find_by(:date => params[:date])
    else
      @daily_record = DailyRecord.new
    end

    @daily_record.user_id = current_user.id
    @daily_record.date = params[:date]
    @daily_record.weight = params[:weight]
    @daily_record.average_fullness = params[:average_fullness]
    @daily_record.weight_loss_probability = params[:weight_loss_probability]

    if @daily_record.save
      redirect_to "/daily_records", :notice => "Daily record created successfully."
    else
      render 'index'
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
