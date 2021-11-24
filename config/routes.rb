Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }

  get '/map-projects/call',    to: 'application#map_projects_call',    as: :map_projects_call
  get '/menu-responsive/call', to: 'application#menu_responsive_call', as: :menu_responsive_call
  get '/admin-nav/call',       to: 'application#admin_nav_call',       as: :admin_nav_call
  
  root                 to: 'pages#home'
  get '/definition',   to: 'pages#definition'
  get '/perspectives', to: 'pages#perspectives'
  get '/resources',    to: 'pages#resources'
  get '/join',         to: 'pages#join'
  get '/about',        to: 'pages#about'
  get '/projects/:id', to: 'pages#project', as: :project

  get   'admin/welcome',   to: 'admin#welcome',   as: :admin_welcome
  get   'admin/dashboard', to: 'admin#dashboard', as: :admin_dashboard
  
  get   'admin/dashboard/requesters/index',  to: 'admin#requesters',        as: :admin_requesters
  get   'admin/dashboard/requesters/excel',  to: 'admin#requesters_excel',  as: :admin_requesters_excel
  patch 'admin/dashboard/update/requesters', to: 'admin#update_requesters', as: :admin_update_requesters
  
  get   'admin/dashboard/projects/new',   to: 'admin#project_new',  as: :admin_new_project
  get   'admin/dashboard/projects/index', to: 'admin#projects',     as: :admin_projects
  get   'admin/dashboard/projects/:id',   to: 'admin#project_show', as: :admin_project_show

  post  'admin/dashboard/projects/create',      to: 'projects#create',  as: :admin_create_project
  patch 'admin/dashboard/projects/:id/update',  to: 'projects#update',  as: :admin_update_project
  delete 'admin/dashboard/projects/:id/delete', to: 'projects#destroy', as: :admin_destroy_project

  post '/join/requesters/create', to: 'requesters#create', as: :new_requester
end

