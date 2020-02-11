Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/posts" => "posts#index"
    post "/posts" => "posts#create"
    get "/posts/:id" => "posts#show"
    patch "/posts/:id" => "posts#update"
    delete "/posts/:id" => "posts#destroy"

    get "cities" => "cities#index"
    post "cities" => "cities#create"
    get "cities/:id" => "cities#show"
    patch "cities/:id" => "cities#update"
    delete "cities/:id" => "cities#destroy"
  end
end
