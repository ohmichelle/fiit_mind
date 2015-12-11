class WeightLossModelsController < ApplicationController
  def index
    @weight_loss_models = WeightLossModel.all

    # Weight Loss Model: Probability of losing weight
    @wlp = 1/(1+Math::E**(-5.7+DailyRecord.average_fullness))

  end

  def show
    @weight_loss_model = WeightLossModel.find(params[:id])
  end

  def new
    @weight_loss_model = WeightLossModel.new
  end

  def create
    @weight_loss_model = WeightLossModel.new
    @weight_loss_model.coefficient_fullness = params[:coefficient_fullness]
    @weight_loss_model.intercept = params[:intercept]
    @weight_loss_model.model_version = params[:model_version]
    @weight_loss_model.model_end_date = params[:model_end_date]
    @weight_loss_model.model_start_date = params[:model_start_date]
    @weight_loss_model.user_id = params[:user_id]

    if @weight_loss_model.save
      redirect_to "/weight_loss_models", :notice => "Weight loss model created successfully."
    else
      render 'new'
    end
  end

  def edit
    @weight_loss_model = WeightLossModel.find(params[:id])
  end

  def update
    @weight_loss_model = WeightLossModel.find(params[:id])

    @weight_loss_model.coefficient_fullness = params[:coefficient_fullness]
    @weight_loss_model.intercept = params[:intercept]
    @weight_loss_model.model_version = params[:model_version]
    @weight_loss_model.model_end_date = params[:model_end_date]
    @weight_loss_model.model_start_date = params[:model_start_date]
    @weight_loss_model.user_id = params[:user_id]

    if @weight_loss_model.save
      redirect_to "/weight_loss_models", :notice => "Weight loss model updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @weight_loss_model = WeightLossModel.find(params[:id])

    @weight_loss_model.destroy

    redirect_to "/weight_loss_models", :notice => "Weight loss model deleted."
  end
end
