Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }

  get '/example-modal/call',   to: 'application#example_modal_call',   as: 'example_modal_call'
  get '/menu-responsive/call', to: 'application#menu_responsive_call', as: 'menu_responsive_call'
  get '/admin-nav/call',       to: 'application#admin_nav_call',       as: 'admin_nav_call'
  
  root                 to: 'pages#home'
  get '/definition',   to: 'pages#definition'
  get '/perspectives', to: 'pages#perspectives'
  get '/resources',    to: 'pages#resources'
  get '/join',         to: 'pages#join'
  get '/about',        to: 'pages#about'

  get 'admin/welcome', to: 'admin#welcome', as: :admin_welcome
end

