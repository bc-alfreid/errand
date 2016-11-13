class RunRequestsController < ApplicationController
  before_action :set_run_request, only: [:show, :edit, :update, :destroy]

  # GET /run_requests
  # GET /run_requests.json
  def index
    @run_requests = RunRequest.all
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
    @run_request.destroy
    respond_to do |format|
      format.html { redirect_to url_for(:controller => :home, :action => :index), notice: 'Run request was successfully deleted.' }
      # format.html { redirect_to run_requests_url, notice: 'Run request was successfully destroyed.' }
      # format.json { head :no_content }
    end
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
