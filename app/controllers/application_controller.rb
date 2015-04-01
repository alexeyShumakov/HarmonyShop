class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_roots

  private
    def set_cookies
      if params[:page_size].present?
        cookies[:page_size] = params[:page_size]
      elsif !cookies[:page_size].present?
        cookies[:page_size] = 6
      end
    end

    def set_roots
      @roots = Category.roots
    end
end
