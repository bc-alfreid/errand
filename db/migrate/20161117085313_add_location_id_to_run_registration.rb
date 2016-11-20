class AddLocationIdToRunRegistration < ActiveRecord::Migration
  def change
    add_column :run_registrations, :from_id, :integer
    add_column :run_registrations, :to_id, :integer
  end
end
