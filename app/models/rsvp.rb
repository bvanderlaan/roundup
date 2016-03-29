class Rsvp < ActiveRecord::Base
	belongs_to :event
	belongs_to :user

	def to_s
		@is_going ? "I'm going" : "Can't make it"
	end
end
