class Event < ApplicationRecord
  belongs_to :creator , class_name: "User"
  has_many :attendace, foreign_key: :attended_event_id,class_name:"Attendace"
  has_many :attendees,through: :attendace
  scope :upcoming, -> { where('event_date >?', DateTime.now)}
  scope :past, -> { where('event_date <?', DateTime.now)}
end
