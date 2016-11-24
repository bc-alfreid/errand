class RequestForRunnerTransaction < ActiveRecord::Base

  belongs_to :user, class_name: "User", foreign_key: "runner_requestor_id"
  belongs_to :run_registration, class_name: "RunRegistration", foreign_key: "run_registration_id"

end
