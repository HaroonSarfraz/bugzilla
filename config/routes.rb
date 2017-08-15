Rails.application.routes.draw do

  root "home#index"

  resources :projects do
    resources :bugs do
      get 'assign_bug'
      get 'change_status'
    end
  end
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }

  get 'bugs' => 'bugs#index', as: :bugs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
