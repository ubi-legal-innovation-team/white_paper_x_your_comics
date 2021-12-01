require 'open-uri'
require 'net/http'
require 'json'
require 'socket'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  
  before_action :parse_user_agent, except: [ :welcome, :dashboard, :requesters, :projects, :project_new, :project_show, :update_requesters, 
                                             :requesters_excel, :create, :update, :destroy, :analytics ]
  
  before_action :authorize_user!,   only: [ :admin_nav_call, :analytics ]
  
  before_action :authorize_admin!,  only: [ :projects, :project_new, :project_show, :requesters, :update_requesters, :requesters_excel ]
  
  before_action :match_slug_params, only: [ :welcome, :dashboard, :requesters, :projects, :project_new, :project_show, :update_requesters, 
                                            :requesters_excel, :analytics ]
    
  def set_locale
    I18n.locale = params[:lang] == "en" || params[:lang] == "fr" ? params[:lang] || locale_from_header : I18n.default_locale
  end

  def locale_from_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE','').scan(/[a-z]{2}/).first
  end

  def map_projects_call
    @projects = Project.find(params[:projects_ids].split().map(&:to_i))
    render partial: "/ajax/ajax_calls/modals/map_projects"
  end

  def menu_responsive_call
    set_locale
    render partial: "/ajax/ajax_calls/dropdowns/menu_responsive"
  end

  def admin_nav_call
    render partial: "admin/ajax/ajax_calls/dropdowns/admin_nav"
  end

  private

  def parse_user_agent
    host_name         = Socket.gethostname

    ip                = Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
    private_socket_ip = ip.ip_address if ip
    ip                = Socket.ip_address_list.detect{|intf| !intf.ipv4_private?}
    public_socket_ip  = ip.ip_address if ip

    public_ip = open('http://whatismyip.akamai.com').read

    url       = "http://ip-api.com/json/#{public_ip}?fields=66846719" 
    uri       = URI(url)
    response  = Net::HTTP.get(uri)
    result    = JSON.parse(response)

    find_or_create_ua(host_name,private_socket_ip,public_socket_ip,public_ip,result)
  end

  def find_or_create_ua(host_name,private_socket_ip,public_socket_ip,public_ip,result)
    agent = UserAgent.find_or_create_by(host_name:host_name,operating_system:request.user_agent)
    
    agent = agent.update(
      privates_socket_ip:agent.privates_socket_ip.push(private_socket_ip).uniq,
      publics_socket_ip:agent.publics_socket_ip.push(public_socket_ip).uniq,
      publics_ip:agent.publics_ip.push(public_ip).uniq,
      countries:agent.countries.push(result["country"]).uniq,
      regions:agent.regions.push(result["region"]).uniq,
      cities:agent.cities.push(result["city"]).uniq,
      zips:agent.zips.push(result["zip"]).uniq,
      isps:agent.isps.push(result["isp"]).uniq,
      orgs:agent.orgs.push(result["org"]).uniq,
      mobile:agent.mobile.push(result["mobile"]).uniq
    )

    @agent = UserAgent.find_by(host_name:host_name,operating_system:request.user_agent)
  end

  def match_slug_params
    if current_user
      if params[:slug] != current_user.email.split('@').first.gsub('.','')
        flash[:alert] = "Acces denied, verified you are the authorized host."
        redirect_to root_path
      else
        @slug = current_user.email.split('@').first.gsub('.','')
      end
    end
  end

  def authorize_user!
    if current_user
      if !current_user.admin
        flash[:alert] = "Acces denied, you don't have permission to acces."
        redirect_to root_path
      end
    end
  end

  def authorize_admin!
    authorize_admins = [ 'alexandra.doornaert@ubisoft.com', 'arthur.dhuy@ubisoft.com', 'marie-lorraine.chiriacopol@ubisoft.com',
                         'geoffrey.delcroix@ubisoft.com' ]

    if current_user
      if !authorize_admins.include?(current_user.email)
        flash[:alert] = "Acces denied, you don't have permission to acces."
        redirect_to admin_dashboard_path
      end
    end
  end
end
