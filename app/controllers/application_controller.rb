class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def example_modal_call
    params.extract!("utf8", "authenticity_token", "controller", "action")
    unsafe_params = params.to_unsafe_hash
    render partial: "/ajax/ajax_calls/modals/example"
  end

  def user_nav_call
    render partial: "/ajax/ajax_calls/dropdowns/user_nav"
  end

  def menu_responsive_call
    render partial: "/ajax/ajax_calls/dropdowns/menu_responsive"
  end

  def notifications_call
# Notification.user(current_user.id).recent.unview.each do |notification|
#   notification.update(view:true)
# end

    render partial: "/ajax/ajax_calls/dropdowns/notifications"
  end
end
