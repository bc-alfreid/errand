class CreateRunRegistrations < ActiveRecord::Migration
  def change
    create_table :run_registrations do |t|
      t.string :location_from_adress_line1
      t.string :location_from_adress_line2
      t.string :location_from_city
      t.string :location_from_postcode
      t.string :location_from_adress_state
      t.string :location_from_adress_country
      t.string :location_to_adress_line1
      t.string :location_to_adress_line2
      t.string :location_to_city
      t.string :location_to_postcode
      t.string :location_to_adress_state
      t.string :location_to_adress_country
      t.date :date_from
      t.date :date_to

      t.timestamps null: false
    end
  end
end
