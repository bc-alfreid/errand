class RunRequest < ActiveRecord::Base
  belongs_to :user

  has_many :locations

  belongs_to :from, class_name: "Location", foreign_key: "from_id"
  belongs_to :to, class_name: "Location", foreign_key: "to_id"

end
