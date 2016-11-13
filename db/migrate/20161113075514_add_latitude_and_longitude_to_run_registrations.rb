class AddLatitudeAndLongitudeToRunRegistrations < ActiveRecord::Migration
  def change
    add_column :run_registrations, :latitude, :float
    add_column :run_registrations, :longitude, :float
  end
end
