class TopController < ApplicationController
  def index
    redirect_to reading_user_path(current_user) if user_signed_in?
  end
end
