class Admin::AdminController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
  before_action { authorize current_user }
  def index
  end
end
