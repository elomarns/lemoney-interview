Rails.application.routes.draw do
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
