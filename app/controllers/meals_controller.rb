class MealsController < ApplicationController
  def index
    @meals = Meal.joins(:daily_record).order("daily_records.date DESC").where(:daily_record_id => current_user.daily_records.select(:id))
    @daily_records = DailyRecord.all
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
  end

  def create
    # Parameters: {"authenticity_token"=> "", "position"=>"1", "fullness_score"=>"5", "description"=>"rice", "daily_record_id"=>"1"}

    @meal = Meal.new
    @meal.position = params[:position]
    @meal.fullness_score = params[:fullness_score]
    @meal.description = params[:description]

    @daily_record = DailyRecord.find_by({:date => params[:date], :user_id => current_user.id})
    @meal.daily_record_id = @daily_record.id

    if @meal.save
      @daily_record.average_fullness = Meal.where(:daily_record_id => @daily_record.id).average("fullness_score").round(2)

      @daily_record.weight_loss_probability = (1/(1+Math::E**(-5.7+@daily_record.average_fullness))).round(2)

      @daily_record.save
        redirect_to "/daily_records/#{@meal.daily_record_id}", :notice => "Meal created successfully."
    else
      redirect_to "/daily_records/#{@meal.daily_record_id}", :alert => "Meal was not created. Please try again."
    end
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])

    @meal.position = params[:position]
    @meal.fullness_score = params[:fullness_score]
    @meal.description = params[:description]

    @meal.daily_record_id = DailyRecord.find_by({:date => params[:date], :user_id => current_user.id}).id

    if @meal.save
      redirect_to "/daily_records/#{@meal.daily_record_id}", :notice => "Meal updated successfully."
    else
      render 'edit', :alert => "Meal was not updated. Please try again."
    end
  end

  def destroy
    @meal = Meal.find(params[:id])

    @meal.destroy

    redirect_to "/daily_records/#{@meal.daily_record_id}", :alert => "Meal deleted."
  end
end
