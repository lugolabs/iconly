Iconly::Engine.routes.draw do
  resources :projects do
    post :generate_font, on: :member
  end

  resources :packages, only: %i[new create destroy] do
    post :share, on: :member
  end

  resources :project_icons, only: %i[create destroy]

  root 'projects#index'
end
