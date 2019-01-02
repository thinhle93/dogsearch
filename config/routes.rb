Rails.application.routes.draw do
  root 'users#index'
  get 'users/index' => 'users#index'
  post 'users/login' => 'users#login'
  get 'users/registerpage' => 'users#registerpage'
  post 'users/register' => 'users#register'

  get 'users/find' => 'users#usershow'

  get 'dog/saved' => 'dogs#saved'
  get 'dog/save' => 'dogs#save_id'
  get 'dog/find/:idapi' => 'dogs#find'
  get 'post/all' => 'posts#allposts'
  get 'post/new' => 'posts#newpost'
  post 'post/createnew' => 'posts#create'
  get 'post/find/:postid' => 'posts#findpost'
  post 'post/newcomment' => 'posts#createcomment'
  get 'logout' => 'users#logout'

  get 'delete/comment/:cmtid/:postid' => 'posts#dltmsg'
  get 'post/mypost' => 'posts#myposts'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
