Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "home#record"
  post "select" => "home#select"
  get "result" => "home#result"
  get "search_1/:character" => "home#search_1"
  get "search_2/:character" => "home#search_2"
end
