class HomeController < ApplicationController
  def index

    # it is like, current user, get all run_registrations assoc to the user
    # Note: curr_user is User
    # User has many run_registrations
    @run_registrations = current_user.run_registrations
    @run_requests = current_user.run_requests

    @hash = Gmaps4rails.build_markers(@run_registrations) do |run_registration, marker|
      marker.lat run_registration.latitude
      marker.lng run_registration.longitude
      marker.infowindow run_registration.desciption    # creates info on the marker
    end

    if !current_user.profile
      redirect_to new_profile_path
    end
  end

end
