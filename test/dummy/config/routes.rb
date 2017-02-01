Rails.application.routes.draw do
  mount Iconly::Engine => '/iconly'

  get 'login'     => 'home#index', as: :login
  delete 'logout' => 'home#index', as: :logout

  root 'home#index'
end
