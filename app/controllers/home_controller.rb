class HomeController < ApplicationController
  def index
    if !current_user.profile
      redirect_to new_profile_path
    end
  end
end
