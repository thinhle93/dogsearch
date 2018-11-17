Rails.application.routes.draw do
  root 'users#index'
  get 'users/index' => 'users#index'
  post 'users/login' => 'users#login'
  post 'users/register' => 'users#register'

  get 'users/find' => 'users#usershow'

  get 'dog/saved' => 'dogs#saved'
  get 'dog/save' => 'dogs#save_id'
  get 'dog/find/:idapi' => 'dogs#find'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
