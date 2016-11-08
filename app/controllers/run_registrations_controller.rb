class RunRegistrationsController < ApplicationController
  before_action :set_run_registration, only: [:show, :edit, :update, :destroy]

  # GET /run_registrations
  # GET /run_registrations.json
  def index
    @run_registrations = RunRegistration.all
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
    @run_registration = RunRegistration.new(run_registration_params)
    @run_registration.user = current_user     # this kinds of makes  @run_registration id to be current_user id

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
    respond_to do |format|
      if @run_registration.update(run_registration_params)
        format.html { redirect_to @run_registration, notice: 'Run registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @run_registration }
      else
        format.html { render :edit }
        format.json { render json: @run_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /run_registrations/1
  # DELETE /run_registrations/1.json
  def destroy
    @run_registration.destroy
    respond_to do |format|
      format.html { redirect_to run_registrations_url, notice: 'Run registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run_registration
      @run_registration = RunRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def run_registration_params
      params.require(:run_registration).permit(:location_from_adress_line1, :location_from_adress_line2, :location_from_city, :location_from_postcode, :location_from_adress_state, :location_from_adress_country, :location_to_adress_line1, :location_to_adress_line2, :location_to_city, :location_to_postcode, :location_to_adress_state, :location_to_adress_country, :date_from, :date_to, :user_id)
    end
end
