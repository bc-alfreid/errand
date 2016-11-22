class RunRequestsController < ApplicationController
  before_action :set_run_request, :set_run_request_location, only: [:show, :edit, :update, :destroy]

  # GET /run_requests
  # GET /run_requests.json
  def index
    @run_requests = RunRequest.all
  end

  def search
    @profile = current_user.profile if current_user

    @run_requests = RunRequest.all

    @nearby_run_request = []
    @nearby_run_requests_from = []
    @nearby_run_requests_to = []

    @searched_nearby_locations_from = Location.near(params['request_from'], 5)
    @searched_nearby_locations_to = Location.near(params['request_to'], 5)

    # p params['request_from']
    # @searched_nearby_locations_from.each do |a|
    #   p a
    # end

    # p params['request_to']
    # @searched_nearby_locations_to.each do |a|
    #   p a
    # end

    @searched_nearby_locations_from.each do |searched_nearby_location_from|
      # p searched_nearby_location_from
      if searched_nearby_location_from.from_run_request         # if location is from_id, get the from_id
        # p 'hit..........'
        @nearby_run_requests_from << searched_nearby_location_from.from_run_request
      end
    end

    @searched_nearby_locations_to.each do |searched_nearby_location_to|
      if searched_nearby_location_to.to_run_request          # if location is from_id, get the to_id
        @nearby_run_requests_to << searched_nearby_location_to.to_run_request
      end
    end

    @run_requests.each do |check_run_registration_search_match|
      if @nearby_run_requests_from.include?(check_run_registration_search_match)
        if @nearby_run_requests_to.include?(check_run_registration_search_match)
          @nearby_run_request << check_run_registration_search_match
        end
      end
    end

  end

  # GET /run_requests/1
  # GET /run_requests/1.json
  def show
  end

  # GET /run_requests/new
  def new
    @run_request = RunRequest.new
  end

  # GET /run_requests/1/edit
  def edit
  end

  # POST /run_requests
  # POST /run_requests.json
  def create
    @run_request = RunRequest.new(run_request_params)
    @run_request.user = current_user

    # Make two location rows and save each
    @location_from = Location.new(
        address_line1: run_request_params[:location_from_adress_line1],
        address_line2: run_request_params[:location_from_adress_line2],
        city: run_request_params[:location_from_city],
        postcode: run_request_params[:location_from_postcode],
        state: run_request_params[:location_from_adress_state],
        country: run_request_params[:location_from_adress_country],
    )
    @location_to = Location.new(
        address_line1: run_request_params[:location_to_adress_line1],
        address_line2: run_request_params[:location_to_adress_line2],
        city: run_request_params[:location_to_city],
        postcode: run_request_params[:location_to_postcode],
        state: run_request_params[:location_to_adress_state],
        country: run_request_params[:location_to_adress_country],
    )

    unless @location_from.save && @location_to.save
      flash[:error] = "Problem Saving Location"
      return redirect_to root_path
    end

    @run_request.from_id = @location_from.id
    @run_request.to_id = @location_to.id

    respond_to do |format|
      if @run_request.save
        format.html { redirect_to url_for(:controller => :home, :action => :index), notice: 'Run registration was successfully created.' }
        # format.html { redirect_to @run_request, notice: 'Run request was successfully created.' }
        # format.json { render :show, status: :created, location: @run_request }
      else
        format.html { render :new }
        format.json { render json: @run_request.errors, status: :unprocessable_entity }
      end
    end



  end

  # PATCH/PUT /run_requests/1
  # PATCH/PUT /run_requests/1.json
  def update

    # TODO: need to make if condition here, if location is not present for run_registration, need to call create location rather than update
    # Make two location rows and save each
    @location_from.update(
        address_line1: run_request_params[:location_from_adress_line1],
        address_line2: run_request_params[:location_from_adress_line2],
        city: run_request_params[:location_from_city],
        postcode: run_request_params[:location_from_postcode],
        state: run_request_params[:location_from_adress_state],
        country: run_request_params[:location_from_adress_country],
    )
    @location_to.update(
        address_line1: run_request_params[:location_to_adress_line1],
        address_line2: run_request_params[:location_to_adress_line2],
        city: run_request_params[:location_to_city],
        postcode: run_request_params[:location_to_postcode],
        state: run_request_params[:location_to_adress_state],
        country: run_request_params[:location_to_adress_country],
    )

    unless @location_from.save && @location_to.save
      flash[:error] = "Problem Updating Location"
      return redirect_to root_path
    end


    respond_to do |format|
      if @run_request.update(run_request_params)
        format.html { redirect_to url_for(:controller => :home, :action => :index), notice: 'Run request was successfully updated.' }
        # format.html { redirect_to @run_request, notice: 'Run request was successfully updated.' }
        # format.json { render :show, status: :ok, location: @run_request }
      else
        format.html { render :edit }
        format.json { render json: @run_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /run_requests/1
  # DELETE /run_requests/1.json
  def destroy
    @location_to.destroy
    @location_from.destroy
    @run_request.destroy
    respond_to do |format|
      format.html { redirect_to url_for(:controller => :home, :action => :index), notice: 'Run request was successfully deleted.' }
      # format.html { redirect_to run_requests_url, notice: 'Run request was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  def set_run_request_location
    @location_from = RunRequest.find(params[:id]).from
    @location_to = RunRequest.find(params[:id]).to
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_run_request
      @run_request = RunRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def run_request_params
      params.require(:run_request).permit(:location_from_adress_line1, :location_from_adress_line2, :location_from_city, :location_from_postcode, :location_from_adress_state, :location_from_adress_country, :location_to_adress_line1, :location_to_adress_line2, :location_to_city, :location_to_postcode, :location_to_adress_state, :location_to_adress_country, :date_to, :user_id, :desrciption, :message)
    end
end
