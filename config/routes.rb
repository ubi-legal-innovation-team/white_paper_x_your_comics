Rails.application.routes.draw do
  
  get '/example-modal/call',   to: 'application#example_modal_call',   as: 'example_modal_call'
  get '/menu-responsive/call', to: 'application#menu_responsive_call', as: 'menu_responsive_call'
  
  root to: 'pages#home'
  get '/definition',   to: 'pages#definition'
  get '/perspectives', to: 'pages#perspectives'
  get '/resources',    to: 'pages#resources'
  get '/join',         to: 'pages#join'
  get '/about',        to: 'pages#about'

  get '/welcome', to: 'admin#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
