class AddDescriptionToRunRequests < ActiveRecord::Migration
  def change
    add_column :run_requests, :desrciption, :string
    add_column :run_requests, :message, :text
  end
end
