class DailyRecordsController < ApplicationController
  def index
    @daily_record = DailyRecord.new
    @daily_records = current_user.daily_records.where(:date => params[:date])
    #@daily_record = DailyRecord.find_by(:date => "2015-12-10", :user_id => current_user.id)

    @meals = Meal.joins(:daily_record).order("daily_records.date DESC").where(:daily_record_id => @daily_records.select(:id))
    @meal = Meal.new
  end

  def show
    @daily_record = DailyRecord.find(params[:id])
  end

  def new
    @daily_record = DailyRecord.new
  end

  def create_day
    # Parameters: {"date"=>"2015-12-09"}
    #if current_user.daily_records.find_by(:date => params[:date])
   #   @daily_record = DailyRecord.find_by(:date => params[:date])
   # else
      @daily_record = DailyRecord.new
    #end

    @daily_record.user_id = current_user.id
    @daily_record.date = params[:date]

    @daily_record.save
    redirect_to "/daily_records", :notice => "Master date set."
  end

  def create
    #if current_user.daily_records.find_by(:date => params[:date])
    #  @daily_record = DailyRecord.find_by(:date => params[:date])
    #else
      @daily_record = DailyRecord.new
    #end

    @daily_record.user_id = current_user.id
    @daily_record.date = params[:date]
    @daily_record.weight = params[:weight]

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
    #Parameters: {""user_id"=>"1", "date"=>"2015-12-10", "weight"=>"111", "id"=>"1"}
    @daily_record = DailyRecord.find_by(:date => params[:date], :user_id => current_user.id)

    @daily_record.user_id = params[:user_id]
    @daily_record.date = params[:date]
    @daily_record.weight = params[:weight]

    @daily_record.average_fullness = (Meal.where(:daily_record_id => @daily_record.id).sum("meals.fullness_score")/Meal.where(:daily_record_id => @daily_record.id).count("meals.fullness_score")).round(2)

    @daily_record.weight_loss_probability = (1/(1+Math::E**(-5.7+@daily_record.average_fullness))).round(2)

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
