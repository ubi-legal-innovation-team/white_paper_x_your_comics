Rails.application.routes.draw do
  get '/example-modal/call',   to: 'application#example_modal_call',   as: 'example_modal_call'
  get '/menu-responsive/call', to: 'application#menu_responsive_call', as: 'menu_responsive_call'
  get '/notifications/call',   to: 'application#notifications_call',   as: 'notifications_call'
  get '/user-nav/call',        to: 'application#user_nav_call',        as: 'user_nav_call'
  get '/home', to: 'pages#home', as: 'home'
  root         to: 'pages#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
