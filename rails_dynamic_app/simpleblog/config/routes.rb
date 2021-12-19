Rails.application.routes.draw do
  root 'posts#index', as: 'home'
  resources :posts
  get '/about' => 'pages#about'
end
