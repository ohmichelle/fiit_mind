class MealsController < ApplicationController
  def index
    @meals = Meal.joins(:daily_record).order("daily_records.date DESC").where(:daily_record_id => current_user.daily_records.select(:id))
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

    #add if logic to make sure daily_record created
    @meal.daily_record_id = DailyRecord.find_by({:date => params[:date], :user_id => current_user.id}).id

    if @meal.save
      redirect_to "/daily_records", :notice => "Meal created successfully."
    else
      render 'new'
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
      redirect_to "/meals", :notice => "Meal updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @meal = Meal.find(params[:id])

    @meal.destroy

    redirect_to "/meals", :notice => "Meal deleted."
  end
end
