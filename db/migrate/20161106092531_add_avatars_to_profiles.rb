class AddAvatarsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :avatars, :string
  end
end
