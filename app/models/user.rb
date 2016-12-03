class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile

  has_many :run_registrations
  has_many :run_requests


  has_many :runner_requests, class_name: "RequestForRunnerTransaction", foreign_key: "runner_requestor_id"
  has_many :run_offers, class_name: "OfferToRunTransaction", foreign_key: "runner_id"

end
