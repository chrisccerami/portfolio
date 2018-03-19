Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"

  resources :comics, only: [:index, :show] do
    resources :pages, only: [:show]
  end

  namespace :admin do
    resources :comics, only: [:index, :new, :create, :edit, :update, :delete] do
      resources :pages, only: [:index, :new, :create, :edit, :update, :delete]
    end
  end
end
