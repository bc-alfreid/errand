class SessionsController < Devise::SessionsController

  def new
    @all_run_registrations = RunRegistration.all
    @all_run_requests = RunRequest.all

    super
  end



end