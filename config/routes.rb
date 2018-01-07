Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :offers do
      member do
        patch :toggle_status
      end
    end

    root "offers#index"
  end

  root "offers#index"
end
