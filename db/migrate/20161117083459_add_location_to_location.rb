class AddLocationToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :address_line1, :string
    add_column :locations, :address_line2, :string
    add_column :locations, :city, :string
    add_column :locations, :postcode, :string
    add_column :locations, :state, :string
    add_column :locations, :country, :string
  end
end
