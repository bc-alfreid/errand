class AddLocationIdToRunRequest < ActiveRecord::Migration
  def change
    add_column :run_requests, :from_id, :integer
    add_column :run_requests, :to_id, :integer
  end
end
