class EventAttendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  belongs_to :attendee, class_name: "User"
end
