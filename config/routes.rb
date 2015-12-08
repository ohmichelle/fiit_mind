Rails.application.routes.draw do
  root "meals#index"
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
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
