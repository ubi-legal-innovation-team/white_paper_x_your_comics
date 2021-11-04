class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  def set_locale
    I18n.locale = params[:lang] == "en" || params[:lang] == "fr" ? params[:lang] || locale_from_header : I18n.default_locale
  end

  def locale_from_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE','').scan(/[a-z]{2}/).first
  end

  def example_modal_call
    params.extract!("utf8", "authenticity_token", "controller", "action")
    unsafe_params = params.to_unsafe_hash
    render partial: "/ajax/ajax_calls/modals/example"
  end

  def menu_responsive_call
    set_locale
    render partial: "/ajax/ajax_calls/dropdowns/menu_responsive"
  end
end
