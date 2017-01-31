Iconly::Engine.routes.draw do
  resources :projects do
    post :generate_font, on: :member
  end
  resources :packages, only: %i(new create destroy) do
    get :share, on: :member
  end

  root 'projects#index'
end
