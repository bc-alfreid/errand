class SessionsController < Devise::SessionsController

  def new
    @all_run_registrations = RunRegistration.all
    p "......."
    @all_run_registrations.each do |p|
      p p
    end

    super
  end



end