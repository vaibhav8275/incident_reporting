class CreateIncidents < ActiveRecord::Migration[5.2]
  def change
    create_table :incidents do |t|
      t.text :incident_types
      t.text :people_involved
      t.text :other_observers
      t.datetime :observed_at
      t.integer :incident_location
      t.text :incident_location_details
      t.text :incident_description
      t.references :user, foreign_key: true, :default => 1
      t.text :attachments

      t.timestamps
    end
  end
end
