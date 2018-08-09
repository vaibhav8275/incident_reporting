json.extract! incident, :id, :incident_type, :anonymous_report, :role, :people_involved, :other_observers, :observed_at, :incident_location, :incident_location_details, :incident_description, :user_id_id, :attachment, :created_at, :updated_at
json.url incident_url(incident, format: :json)
