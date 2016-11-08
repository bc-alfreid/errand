class AddUserToRunRegistration < ActiveRecord::Migration
  def change
    add_reference :run_registrations, :user, index: true, foreign_key: true
  end
end
