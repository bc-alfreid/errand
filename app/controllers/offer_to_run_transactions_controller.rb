class OfferToRunTransactionsController < ApplicationController

  # POST /OfferToRunTransactions
  # POST /OfferToRunTransactions.json
  def create

    # TODO: if already in table, need to prevent save, either not show on view, or prevent save on this controller

    @offer_to_run_transaction = OfferToRunTransaction.new(
        runner_id: params[:runner_id],
        run_request_id: params[:run_request_id]
    )

    respond_to do |format|
      if @offer_to_run_transaction.save
        format.html { redirect_to url_for(:controller => :home, :action => :index), notice: 'Notice sent to requestor.' }
        #format.html { redirect_to @run_registration, notice: 'Run registration was successfully created.' }
        #format.json { render :show, status: :created, location: @run_registration }
      else
        format.html { render :new }
        format.json { render json: @run_registration.errors, status: :unprocessable_entity }
      end
    end

  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def offer_to_run_transaction_params
    params.permit(:runner_id, :run_request_id)
  end

end
