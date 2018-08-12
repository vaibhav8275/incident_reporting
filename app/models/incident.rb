class Incident < ApplicationRecord
  belongs_to :user
  
  mount_uploaders :attachments, AttachmentUploader
  serialize :attachments, JSON

  accepts_nested_attributes_for :user
  serialize :incident_types, Array

  validates :incident_description, presence: true
  validates_with DatetimeValidator

  enum incident_location: {
  	on_school: 0, 
  	during_transportation: 1, 
  	school_event: 2, 
  	more_details: 3
  }
  INCIDENT_TYPES = ['Alcohol', 'Assault', 'Bullying', 'Hazing', 'Drugs', 'Graffiti']

  attr_accessor :submit_anonymously

  #.to_s(:db) converts a time to string in UTC.
  def observed_at_string
    observed_at ? observed_at.to_s : Time.zone.now
  end

  def observed_at_string=(observed_at_string)
    self.observed_at = Time.zone.parse(observed_at_string)
  end
end