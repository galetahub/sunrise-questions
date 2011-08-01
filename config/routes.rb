Rails.application.routes.draw do
  namespace :manage do
    resources :structures do
      resources :questions
    end
  end
end
