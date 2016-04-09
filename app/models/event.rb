class Event < ActiveRecord::Base
	belongs_to :user
	has_many :rsvps, dependent: :destroy
	has_many :attendies, :class_name => 'User', :foreign_key => 'user_id', :through => :rsvps, :source => :user
	has_many :comments, dependent: :destroy
	
	validates :title, presence: true,
	          length: { maximum: 72 }
	validates :description, presence: true
	validates :location, presence: true,
	          length: { maximum: 72 }
	validates :duration, 
			  numericality: { only_integer: true, 
			  	              greater_than_or_equal_to: 30,
			  				  less_than: 1440 }
	validate :start_date_is_in_future

	def start_date_is_in_future
		#Known bug here, the server is accepting the user inputted startdatetime 
		#as UTC but the user entered it expecting local time zone.
		#For now just make sure the date part is either today or in the future.
		if startdatetime.present? && startdatetime <= Date.today
	      errors.add(:startdatetime, "The event can't be in the past")
	    end
	end

	def to_s
		title
	end

	def attendies_going
		User.joins(:rsvps).uniq.where( "is_going = 1 and event_id = #{id}")
	end

	def attendies_not_going
		User.joins(:rsvps).uniq.where( "is_going = 0 and event_id = #{id}")
	end
end
