class OfferToRunTransaction < ActiveRecord::Base

  belongs_to :user, class_name: "User", foreign_key: "runner_id"
  belongs_to :run_request, class_name: "RunRequest", foreign_key: "run_request_id"

end
