class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :authorize_user!,  only: :admin_nav_call
  before_action :authorize_admin!, only: [ :projects, :project_new, :project_show, :update_requesters, :requesters_excel, :create, :update, :destroy ]

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
