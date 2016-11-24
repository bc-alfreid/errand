class CreateRequestForRunnerTransactions < ActiveRecord::Migration
  def change
    create_table :request_for_runner_transactions do |t|
      t.string :runner_requestor_id
      t.string :run_registration_id

      t.timestamps null: false
    end
  end
end
