class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create #pulled from Meal create, need to edit
    @user = User.new
    @user.position = params[:position]
    @user.fullness_score = params[:fullness_score]
    @user.description = params[:description]

    @user.daily_record_id = DailyRecord.find_by({:date => params[:date], :user_id => current_user.id}).id

    if @user.save
      redirect_to "/users", :notice => "User created successfully."
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.dob = params[:dob]
    @user.gender = params[:gender]
    @user.height_inches = params[:height_inches]
    @user.weight_starting_lbs = params[:weight_starting_lbs]
    @user.weight_goal_lbs = params[:weight_goal_lbs]
    @user.activity_level = params[:activity_level]
    @user.zip = params[:zip]

    if @user.save #AND date.valid_date?()
      redirect_to "/users/#{@user.id}", :notice => "User updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy

    redirect_to "/users", :notice => "User deleted."
  end
end
