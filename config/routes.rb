Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }

  get '/map-projects/call',    to: 'application#map_projects_call',    as: :map_projects_call
  get '/menu-responsive/call', to: 'application#menu_responsive_call', as: :menu_responsive_call
  get '/admin-nav/call',       to: 'application#admin_nav_call',       as: :admin_nav_call
  
  root                        to: 'pages#home'
  get '/definition',          to: 'pages#definition'
  get '/perspectives',        to: 'pages#perspectives'
  get '/resources',           to: 'pages#resources'
  get '/join',                to: 'pages#join'
  get '/about',               to: 'pages#about'
  get '/projects/:id',        to: 'pages#project',             as: :project
  get '/map-projects/search', to: 'pages#map_projects_search', as: :map_projects_search
  get "/robots.:format",      to: "pages#robots"
  get "/legal-notices",       to: "pages#legal_notices"

  post '/join/requesters/create', to: 'requesters#create', as: :new_requester

  constraints subdomain: /admin/ do
    get   ':slug/welcome',   to: 'admin#welcome',   as: :admin_welcome
    get   ':slug/dashboard', to: 'admin#dashboard', as: :admin_dashboard

    get   ':slug/dashboard/analytics',       to: 'admin#analytics',       as: :admin_analytics
    get   ':slug/dashboard/analytics/excel', to: 'admin#analytics_excel', as: :admin_analytics_excel
    
    get   ':slug/dashboard/requesters/index',     to: 'admin#requesters',        as: :admin_requesters
    get   ':slug/dashboard/requesters/excel',     to: 'admin#requesters_excel',  as: :admin_requesters_excel
    get   ':slug/dashboard/requesters/:id/excel', to: 'admin#requester_excel',   as: :admin_requester_excel
    patch ':slug/dashboard/update/requesters',    to: 'admin#update_requesters', as: :admin_update_requesters
    
    get   ':slug/dashboard/projects/new',   to: 'admin#project_new',  as: :admin_new_project
    get   ':slug/dashboard/projects/index', to: 'admin#projects',     as: :admin_projects
    get   ':slug/dashboard/projects/:id',   to: 'admin#project_show', as: :admin_project_show

    post  ':slug/dashboard/projects/create',      to: 'projects#create',  as: :admin_create_project
    patch ':slug/dashboard/projects/:id/update',  to: 'projects#update',  as: :admin_update_project
    delete ':slug/dashboard/projects/:id/delete', to: 'projects#destroy', as: :admin_destroy_project
  end

  constraints(host: /^(?!www\.)/i) do
    get '(*any)' => redirect { |params, request|
      URI.parse(request.url).tap { |uri| uri.host = "www.#{uri.host}" }.to_s
    }
  end
end

