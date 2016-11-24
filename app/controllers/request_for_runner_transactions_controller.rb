class RequestForRunnerTransactionsController < ApplicationController

  # POST /RequestForRunnerTransactions
  # POST /RequestForRunnerTransactions.json
  def create


    # TODO: if already in table, need to prevent save, either not show on view, or prevent save on this controller

    respond_to do |format|
      format.html { redirect_to url_for(:controller => :home, :action => :index), notice: 'Run registration was deleted.' }
    end

    @request_for_runner_transaction = RequestForRunnerTransaction.new(
        runner_requestor_id: params[:runner_requestor_id],
        run_registration_id: params[:run_registration_id]
    )
    @request_for_runner_transaction.save

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def request_for_runner_transaction_params
    params.permit(:runner_requestor_id, :run_registration_id)
  end

end
