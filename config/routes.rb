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

    get "comments" => "comments#index"
    post "comments" => "comments#create"
    get "comments/:id" => "comments#show"
    patch "comments/:id" => "comments#update"
    delete "comments/:id" => "comments#destroy"

    get "restaurants" => "restaurants#index"
    post "restaurants" => "restaurants#create"
    get "restaurants/:id" => "restaurants#show"
    patch "restaurants/:id" => "restaurants#update"
    delete "restaurants/:id" => "restaurants#destroy"

    get "activities" => "activities#index"
    post "activities" => "activities#create"
    get "activities/:id" => "activities#show"
    patch "activities/:id" => "activities#update"
    delete "activities/:id" => "activities#destroy"
  end
end
