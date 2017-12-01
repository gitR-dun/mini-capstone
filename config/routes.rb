Rails.application.routes.draw do
  get '/all_products' => 'products#the_products'
end
