Rails.application.routes.draw do
  root 'signups#new'
  get 'thanks' => 'pages#thanks'
  resources :signups
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
