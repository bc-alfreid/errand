class RunRegistration < ActiveRecord::Base

  belongs_to :user

  has_many :locations

  # geocoded_by :full_street_address
  # after_validation :geocode
  #
  # def full_street_address #from
  #   [location_from_adress_line1, location_from_adress_line2, location_from_city, location_from_adress_state, location_from_adress_country].compact.join(',')     # contructs address based on model fields :suburb :street, :country
  # end


  belongs_to :from, class_name: "Location", foreign_key: "from_id"
  belongs_to :to, class_name: "Location", foreign_key: "to_id"
  # rails c
  # run = RunRegistration.last
  # run.from
  # run.to
  # TODO: drop column run_registration_id and run_request_id on locations table, no need because of the above associations

end
