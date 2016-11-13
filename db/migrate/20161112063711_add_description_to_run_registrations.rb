class AddDescriptionToRunRegistrations < ActiveRecord::Migration
  def change
    add_column :run_registrations, :desciption, :string
    add_column :run_registrations, :message, :text
  end
end
