class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name

  end

  def after_sign_in_path_for(resource)
    private_office_path
  end

  include CurrentCart
  protect_from_forgery with: :exception
  before_action :set_roots, :set_cart, :set_services

  private
    def set_cookies
      if params[:page_size].present?
        cookies[:page_size] = params[:page_size]
      elsif !cookies[:page_size].present?
        cookies[:page_size] = 6
      end
    end

    def set_services
      @services_groups = ServicesGroup.all
    end

    def set_roots
      @roots = Category.roots
    end

  def current_user_admin?
    unless current_user.try(:admin?)
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
