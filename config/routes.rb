Iconly::Engine.routes.draw do
  resources :packages, only: %i(index new create destroy) do
    get :share, on: :member
  end

  root 'packages#index'
end
