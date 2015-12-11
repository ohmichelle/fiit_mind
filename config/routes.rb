Rails.application.routes.draw do
  root "meals#index"
  get "/info", :controller => "users", :action => "info"

  # Routes for the Meal resource:
  # CREATE
  get "/meals/new", :controller => "meals", :action => "new"
  post "/create_meal", :controller => "meals", :action => "create"

  # READ
  get "/meals", :controller => "meals", :action => "index"
  get "/meals/:id", :controller => "meals", :action => "show"

  # UPDATE
  get "/meals/:id/edit", :controller => "meals", :action => "edit"
  post "/update_meal/:id", :controller => "meals", :action => "update"

  # DELETE
  get "/delete_meal/:id", :controller => "meals", :action => "destroy"
  #------------------------------

  # Routes for the Daily_record resource:
  # CREATE
  get "/daily_records/new", :controller => "daily_records", :action => "new"
  post "/create_daily_record", :controller => "daily_records", :action => "create"

  # READ
  get "/daily_records", :controller => "daily_records", :action => "index"
  get "/daily_records/:id", :controller => "daily_records", :action => "show"

  # UPDATE
  get "/daily_records/:id/edit", :controller => "daily_records", :action => "edit"
  post "/update_daily_record/:id", :controller => "daily_records", :action => "update"

  # DELETE
  get "/delete_daily_record/:id", :controller => "daily_records", :action => "destroy"
  #------------------------------

  # Routes for the Weight_loss_model resource:
  # CREATE
  get "/weight_loss_models/new", :controller => "weight_loss_models", :action => "new"
  post "/create_weight_loss_model", :controller => "weight_loss_models", :action => "create"

  # READ
  get "/weight_loss_models", :controller => "weight_loss_models", :action => "index"
  get "/weight_loss_models/:id", :controller => "weight_loss_models", :action => "show"

  # UPDATE
  get "/weight_loss_models/:id/edit", :controller => "weight_loss_models", :action => "edit"
  post "/update_weight_loss_model/:id", :controller => "weight_loss_models", :action => "update"

  # DELETE
  get "/delete_weight_loss_model/:id", :controller => "weight_loss_models", :action => "destroy"
  #------------------------------

  devise_for :users

  # Routes for the User resource:

  # CREATE
  get "/users/new", :controller => "users", :action => "new"
  post "/create_user", :controller => "users", :action => "create"

  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"

  # UPDATE
  get "/users/:id/edit", :controller => "users", :action => "edit"
  post "/update_user/:id", :controller => "users", :action => "update"

  # DELETE
  get "/delete_user/:id", :controller => "users", :action => "destroy"

  #get "/my_meals", :controller => "users", :action => "my_meals"

 #------------------------------

  # Routes for the Chart resource:

  # READ
  get "/charts", :controller => "charts", :action => "index"
  #get "/users/:id", :controller => "users", :action => "show"

end
