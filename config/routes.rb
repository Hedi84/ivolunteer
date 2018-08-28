Rails.application.routes.draw do

  root to: 'pages#home'
  get '/pages/dashboard', to: 'pages#dashboard', as: 'dashboard'
  # get '', to: 'notes#show', as'show_note'
  resources :reports, except: [:update] do
    resources :notes, except: [:index, :destroy]
  end
  resources :notes, only: [:destroy]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
