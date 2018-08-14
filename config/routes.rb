Rails.application.routes.draw do

  root to: 'pages#home'
  get '/pages/dashboard', to: 'pages#dashboard', as: 'dashboard'
  # get '', to: 'notes#show', as'show_note'
  resources :notes, only: [:edit]
  resources :reports, except: [:update] do
    resources :notes, except: [:index]
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
