class AddEventToRsvp < ActiveRecord::Migration
  def change
    add_reference :rsvps, :event, index: true, foreign_key: true
  end
end
