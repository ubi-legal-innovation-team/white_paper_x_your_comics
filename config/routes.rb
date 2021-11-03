Rails.application.routes.draw do
  
  get '/example-modal/call',   to: 'application#example_modal_call',   as: 'example_modal_call'
  get '/menu-responsive/call', to: 'application#menu_responsive_call', as: 'menu_responsive_call'
  
  root to: 'pages#home'
  get '/perspectives', to: 'admin#perspectives'
  get '/resources',    to: 'admin#resources'
  get '/join',         to: 'admin#join'
  get '/about',        to: 'admin#about'

  get '/welcome', to: 'admin#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
