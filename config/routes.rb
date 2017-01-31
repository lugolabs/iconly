Iconly::Engine.routes.draw do
  resources :projects do
    post :generate_font, on: :member
  end
  resources :packages, only: %i(index new create destroy) do
    get :share, on: :member
  end

  root 'packages#index'
end
