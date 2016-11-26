class HomeController < ApplicationController
  def index

    # it is like, current user, get all run_registrations assoc to the user
    # Note: curr_user is User
    # User has many run_registrations
    @run_registrations = current_user.run_registrations
    @run_requests = current_user.run_requests

    if !current_user.profile
      redirect_to new_profile_path
    end

    @dic_run_registrations
    @run_registrations.each do |run_registration|
      p '...................'
      p run_registration.run_registration_requests
      p run_registration.run_registration_requests.count
    end

  end
end
