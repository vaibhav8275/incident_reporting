class Incident < ApplicationRecord
  belongs_to :user
  mount_uploader :attachment, AttachmentUploader
  enum incident_location: {
  	on_school: 0, 
  	during_transportation: 1, 
  	school_event: 2, 
  	more_details: 3
  }

  INCIDENT_TYPES = ['Alcohol', 'Assault', 'Bullying', 'Hazing', 'Drugs', 'Graffiti']

  accepts_nested_attributes_for :user
end
