Iconly::Engine.routes.draw do
  resources :packages, only: %i(index new create destroy)

  root 'packages#index'
end
