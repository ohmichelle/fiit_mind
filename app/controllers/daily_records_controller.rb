class DailyRecordsController < ApplicationController
  def index
    @daily_record = DailyRecord.new
    @daily_records = current_user.daily_records

    @meals = Meal.joins(:daily_record).order("daily_records.date DESC").where(:daily_record_id => @daily_records.select(:id))
    @meal = Meal.new
  end

  def show
    #Pulls specific daily record, creates meals
    @daily_record = DailyRecord.find(params[:id])
    @daily_records = current_user.daily_records

    @meals = @daily_record.meals
    @meal = Meal.new
  end

  def new
    @daily_record = DailyRecord.new
  end

  def create_day
    # Parameters: {"date"=>"2015-12-09"}
    if current_user.daily_records.find_by(:date => params[:date])
      @daily_record = DailyRecord.find_by(:date => params[:date], :user_id => current_user.id)
      redirect_to "/daily_records/#{@daily_record.id}"
    else
      @daily_record = DailyRecord.new
      @daily_record.user_id = current_user.id
      @daily_record.date = params[:date]
      @daily_record.weight = 0

      if @daily_record.save
        redirect_to "/daily_records/#{@daily_record.id}", :notice => "Master date set."
      else
        redirect_to "/daily_records", :alert => "Master date not set. Please try again."
      end
    end
  end

  def create
    if current_user.daily_records.find_by(:date => params[:date])
      @daily_record = DailyRecord.find_by(:date => params[:date], :user_id => current_user.id)

      @daily_record.weight = params[:weight]

      @daily_record.save
      redirect_to "/daily_records/#{@daily_record.id}", :notice => "Daily record updated successfully."
    else
      @daily_record = DailyRecord.new
      @daily_record.user_id = current_user.id
      @daily_record.date = params[:date]
      @daily_record.weight = params[:weight]

      if @daily_record.save
        redirect_to "/daily_records/#{@daily_record.id}", :notice => "Daily record created successfully."
      else
        redirect_to "/daily_records/#{@daily_record.id}", :alert => "Daily record was not created."
      end
    end
  end

  def edit
    @daily_record = DailyRecord.find(params[:id])
  end

  def update
    #Parameters: {""user_id"=>"1", "date"=>"2015-12-10", "weight"=>"111", "id"=>"1"}
    #@daily_record = DailyRecord.find_by(:date => params[:date], :user_id => current_user.id)
    @daily_record = DailyRecord.find(params[:id])

    @daily_record.user_id = params[:user_id]
    @daily_record.date = params[:date]
    @daily_record.weight = params[:weight]

    @daily_record.average_fullness = (Meal.where(:daily_record_id => @daily_record.id).average("fullness_score")).round(2)

    @daily_record.weight_loss_probability = (1/(1+Math::E**(-5.7+@daily_record.average_fullness))).round(2)

    if @daily_record.save
      redirect_to "/daily_records/#{@daily_record.id}", :notice => "Daily record updated successfully."
    else
      render 'edit', :alert => "Daily record not updated. Please try again."
    end
  end

  def destroy
    @daily_record = DailyRecord.find(params[:id])

    @daily_record.destroy

    redirect_to "/daily_records/#{@daily_record.id}", :alert => "Daily record deleted."
  end
end
