Rails.application.routes.draw do
  root :to => "cheeses#index"
  # Routes for the Tasting resource:
  # CREATE
  get "/tastings/new", :controller => "tastings", :action => "new"
  post "/create_tasting", :controller => "tastings", :action => "create"

  # READ
  get "/tastings", :controller => "tastings", :action => "index"
  get "/tastings/:id", :controller => "tastings", :action => "show"

  # UPDATE
  get "/tastings/:id/edit", :controller => "tastings", :action => "edit"
  post "/update_tasting/:id", :controller => "tastings", :action => "update"

  # DELETE
  get "/delete_tasting/:id", :controller => "tastings", :action => "destroy"
  #------------------------------

  # Routes for the Producer resource:
  # CREATE
  get "/producers/new", :controller => "producers", :action => "new"
  post "/create_producer", :controller => "producers", :action => "create"

  # READ
  get "/producers", :controller => "producers", :action => "index"
  get "/producers/:id", :controller => "producers", :action => "show"

  # UPDATE
  get "/producers/:id/edit", :controller => "producers", :action => "edit"
  post "/update_producer/:id", :controller => "producers", :action => "update"

  # DELETE
  get "/delete_producer/:id", :controller => "producers", :action => "destroy"
  #------------------------------

  # Routes for the Region resource:
  # CREATE
  get "/regions/new", :controller => "regions", :action => "new"
  post "/create_region", :controller => "regions", :action => "create"

  # READ
  get "/regions", :controller => "regions", :action => "index"
  get "/regions/:id", :controller => "regions", :action => "show"

  # UPDATE
  get "/regions/:id/edit", :controller => "regions", :action => "edit"
  post "/update_region/:id", :controller => "regions", :action => "update"

  # DELETE
  get "/delete_region/:id", :controller => "regions", :action => "destroy"
  #------------------------------

  # Routes for the Cheese resource:
  # CREATE
  get "/cheeses/new", :controller => "cheeses", :action => "new"
  post "/create_cheese", :controller => "cheeses", :action => "create"

  # READ
  get "/cheeses", :controller => "cheeses", :action => "index"
  get "/cheeses/:id", :controller => "cheeses", :action => "show"

  # UPDATE
  get "/cheeses/:id/edit", :controller => "cheeses", :action => "edit"
  post "/update_cheese/:id", :controller => "cheeses", :action => "update"

  # DELETE
  get "/delete_cheese/:id", :controller => "cheeses", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
