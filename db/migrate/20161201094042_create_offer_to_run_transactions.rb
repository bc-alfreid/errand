class CreateOfferToRunTransactions < ActiveRecord::Migration
  def change
    create_table :offer_to_run_transactions do |t|
      t.string :runner_id
      t.string :run_request_id

      t.timestamps null: false
    end
  end
end
