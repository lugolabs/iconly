Iconly::Engine.routes.draw do
  resources :projects
  resources :packages, only: %i(index new create destroy) do
    get :share, on: :member
  end

  root 'packages#index'
end
