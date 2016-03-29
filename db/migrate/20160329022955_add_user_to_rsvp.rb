class AddUserToRsvp < ActiveRecord::Migration
  def change
    add_reference :rsvps, :user, index: true, foreign_key: true
  end
end
