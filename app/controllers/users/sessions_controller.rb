# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout "admin"

  def new
    super
  end

  def create
    super
  end

  def destroy
    super
  end

  protected

  # def after_sign_in_path_for(resource_or_scope)
  #   redirect_to admin_welcome_path || super
  # end
end
