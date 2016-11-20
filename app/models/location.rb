class Location < ActiveRecord::Base
  # belongs_to :run_registration      # dont need,  see line 4
  # belongs_to :run_request           # dont need,  see line 5
  has_one :from_run_registration, class_name: "RunRegistration", foreign_key: "from_id"
  has_one :to_run_registration, class_name: "RunRegistration", foreign_key: "to_id"

  # rails c
  # location = Location.last
  # location.to_run_registration  note. if location is a to_id
  # TODO: drop column run_registration_id and run_request_id on locations table, no need because of the above associations

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address #from
    [address_line1, address_line2, city, state, postcode, state, country].compact.join(',')     # contructs address based on model fields :suburb :street, :country
  end

end
