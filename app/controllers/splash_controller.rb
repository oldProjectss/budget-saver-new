class SplashController < ApplicationController
  skip_before_action :authenticate_user!
  before_action { redirect_to groups_path if user_signed_in? }

  def index
    @user = User.new
  end
end
