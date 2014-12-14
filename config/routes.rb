Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :users, :path => "u", only: [:show]
  resources :games, only: [:index, :show, :new, :create]
  root 'pages#home'
end
