Rails.application.routes.draw do
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
