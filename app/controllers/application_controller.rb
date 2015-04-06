class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
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
end
