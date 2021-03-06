class RequestForRunnerTransactionsController < ApplicationController

  # POST /RequestForRunnerTransactions
  # POST /RequestForRunnerTransactions.json
  def create


    # TODO: if already in table, need to prevent save, either not show on view, or prevent save on this controller

    @request_for_runner_transaction = RequestForRunnerTransaction.new(
        runner_requestor_id: params[:runner_requestor_id],
        run_registration_id: params[:run_registration_id]
    )

    respond_to do |format|
      if @request_for_runner_transaction.save
        format.html { redirect_to url_for(:controller => :home, :action => :index), notice: 'Notice sent to runner.' }
        #format.html { redirect_to @run_registration, notice: 'Run registration was successfully created.' }
        #format.json { render :show, status: :created, location: @run_registration }
      else
        format.html { render :new }
        format.json { render json: @run_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def request_for_runner_transaction_params
    params.permit(:runner_requestor_id, :run_registration_id)
  end

end
