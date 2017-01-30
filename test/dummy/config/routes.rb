Rails.application.routes.draw do
  mount Iconly::Engine => '/iconly'

  root 'home#index'
end
