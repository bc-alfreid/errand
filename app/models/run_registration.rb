class RunRegistration < ActiveRecord::Base

  belongs_to :user

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    [location_from_adress_line1, location_from_adress_line2, location_from_city, location_from_adress_state, location_from_adress_country].compact.join(',')     # contructs address based on model fields :suburb :street, :country
  end

end
