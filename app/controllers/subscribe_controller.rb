class SubscribeController < ApplicationController
  def subscribe
    respond_to do |format|
      format.html { redirect_to root_path  }
      format.json { head :no_content }
    end
  end
end
