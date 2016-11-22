class RunRegistrationsController < ApplicationController
  before_action :set_run_registration, :set_run_registration_location, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: [:search]

  # GET /run_registrations
  # GET /run_registrations.json
  def index
    @run_registrations = RunRegistration.all
  end

  def search

    @profile = current_user.profile if current_user

    @run_registrations = RunRegistration.all

    @nearby_run_registration = []
    @nearby_run_registrations_from = []
    @nearby_run_registrations_to = []

    @searched_nearby_locations_from = Location.near(params['runner_from'], 5)
    @searched_nearby_locations_to = Location.near(params['runner_to'], 5)

    @searched_nearby_locations_from.each do |searched_nearby_location_from|
      if searched_nearby_location_from.from_run_registration          # if location is from_id, get the from_id
        @nearby_run_registrations_from << searched_nearby_location_from.from_run_registration
      end
    end

    @searched_nearby_locations_to.each do |searched_nearby_location_to|
      if searched_nearby_location_to.to_run_registration          # if location is from_id, get the to_id
        @nearby_run_registrations_to << searched_nearby_location_to.to_run_registration
      end
    end

    @run_registrations.each do |check_run_registration_search_match|
      if @nearby_run_registrations_from.include?(check_run_registration_search_match)
        if @nearby_run_registrations_to.include?(check_run_registration_search_match)
          @nearby_run_registration << check_run_registration_search_match
        end
      end
    end

  end

  # GET /run_registrations/1
  # GET /run_registrations/1.json
  def show
  end

  # GET /run_registrations/new
  def new
    @run_registration = RunRegistration.new
  end

  # GET /run_registrations/1/edit
  def edit
  end

  # POST /run_registrations
  # POST /run_registrations.json
  def create
    @run_registration = RunRegistration.new(
        date_from: run_registration_params[:date_from],
        date_to: run_registration_params[:date_to],
        message: run_registration_params[:message],
        desciption:  run_registration_params[:desciption]
    )
    @run_registration.user = current_user     # this kinds of makes  @run_registration id to be current_user id

    # Make two location rows and save each
    @location_from = Location.new(
        address_line1: run_registration_params[:location_from_adress_line1],
        address_line2: run_registration_params[:location_from_adress_line2],
        city: run_registration_params[:location_from_city],
        postcode: run_registration_params[:location_from_postcode],
        state: run_registration_params[:location_from_adress_state],
        country: run_registration_params[:location_from_adress_country],
    )
    @location_to = Location.new(
        address_line1: run_registration_params[:location_to_adress_line1],
        address_line2: run_registration_params[:location_to_adress_line2],
        city: run_registration_params[:location_to_city],
        postcode: run_registration_params[:location_to_postcode],
        state: run_registration_params[:location_to_adress_state],
        country: run_registration_params[:location_to_adress_country],
    )

    unless @location_from.save && @location_to.save
      flash[:error] = "Problem Savinf Location"
      return redirect_to root_path
    end

    @run_registration.from_id = @location_from.id
    @run_registration.to_id = @location_to.id

    respond_to do |format|
      if @run_registration.save
        format.html { redirect_to url_for(:controller => :home, :action => :index), notice: 'Run registration was successfully created.' }
        #format.html { redirect_to @run_registration, notice: 'Run registration was successfully created.' }
        #format.json { render :show, status: :created, location: @run_registration }
      else
        format.html { render :new }
        format.json { render json: @run_registration.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /run_registrations/1
  # PATCH/PUT /run_registrations/1.json
  def update

    # TODO: need to make if condition here, if location is not present for run_registration, need to call create location rather than update
    # Make two location rows and save each
    @location_from.update(
        address_line1: run_registration_params[:location_from_adress_line1],
        address_line2: run_registration_params[:location_from_adress_line2],
        city: run_registration_params[:location_from_city],
        postcode: run_registration_params[:location_from_postcode],
        state: run_registration_params[:location_from_adress_state],
        country: run_registration_params[:location_from_adress_country],
    )
    @location_to.update(
        address_line1: run_registration_params[:location_to_adress_line1],
        address_line2: run_registration_params[:location_to_adress_line2],
        city: run_registration_params[:location_to_city],
        postcode: run_registration_params[:location_to_postcode],
        state: run_registration_params[:location_to_adress_state],
        country: run_registration_params[:location_to_adress_country],
    )

    unless @location_from.save && @location_to.save
      flash[:error] = "Problem Updating Location"
      return redirect_to root_path
    end

    respond_to do |format|
      if @run_registration.update(
          date_from: run_registration_params[:date_from],
          date_to: run_registration_params[:date_to],
          message: run_registration_params[:message],
          desciption:  run_registration_params[:desciption]
      )
        format.html { redirect_to url_for(:controller => :home, :action => :index), notice: 'Run registration was successfully updated.' }
        # format.html { redirect_to @run_registration, notice: 'Run registration was successfully updated.' }
        # format.json { render :show, status: :ok, location: @run_registration }
      else
        format.html { render :edit }
        format.json { render json: @run_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /run_registrations/1
  # DELETE /run_registrations/1.json
  def destroy
    @location_to.destroy
    @location_from.destroy
    @run_registration.destroy
    respond_to do |format|
      format.html { redirect_to url_for(:controller => :home, :action => :index), notice: 'Run registration was deleted.' }
      # format.html { redirect_to run_registrations_url, notice: 'Run registration was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run_registration
      @run_registration = RunRegistration.find(params[:id])
    end

    def set_run_registration_location
      @location_from = RunRegistration.find(params[:id]).from
      @location_to = RunRegistration.find(params[:id]).to
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def run_registration_params
      params.require(:run_registration).permit(:location_from_adress_line1, :location_from_adress_line2, :location_from_city, :location_from_postcode, :location_from_adress_state, :location_from_adress_country, :location_to_adress_line1, :location_to_adress_line2, :location_to_city, :location_to_postcode, :location_to_adress_state, :location_to_adress_country, :date_from, :date_to, :user_id, :message, :desciption)
    end

  # # Never trust parameters from the scary internet, only allow the white list through.
  # def run_registration_params
  #   params.require(:run_registration).permit(:location_from_adress_line1, :location_from_adress_line2, :location_from_city, :location_from_postcode, :location_from_adress_state, :location_from_adress_country, :location_to_adress_line1, :location_to_adress_line2, :location_to_city, :location_to_postcode, :location_to_adress_state, :location_to_adress_country, :date_from, :date_to, :user_id, :message, :desciption)
  # end
  #
  # # Never trust parameters from the scary internet, only allow the white list through.
  # def location_from_params
  #   params.require(:run_registration).permit(:location_from_adress_line1, :location_from_adress_line2, :location_from_city, :location_from_postcode, :location_from_adress_state, :location_from_adress_country, :location_to_adress_line1, :location_to_adress_line2, :location_to_city, :location_to_postcode, :location_to_adress_state, :location_to_adress_country, :date_from, :date_to, :user_id, :message, :desciption)
  # end
  #
  # # Never trust parameters from the scary internet, only allow the white list through.
  # def location_to_params
  #   params.require(:run_registration).permit(:location_from_adress_line1, :location_from_adress_line2, :location_from_city, :location_from_postcode, :location_from_adress_state, :location_from_adress_country, :location_to_adress_line1, :location_to_adress_line2, :location_to_city, :location_to_postcode, :location_to_adress_state, :location_to_adress_country, :date_from, :date_to, :user_id, :message, :desciption)
  # end
end
