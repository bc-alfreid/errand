class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.belongs_to :run_registration, index: true, foreign_key: true
      t.belongs_to :run_request, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
