require "application_system_test_case"

class IncidentsTest < ApplicationSystemTestCase
  setup do
    @incident = incidents(:one)
  end

  test "visiting the index" do
    visit incidents_url
    assert_selector "h1", text: "Incidents"
  end

  test "creating a Incident" do
    visit incidents_url
    click_on "New Incident"

    fill_in "Anonymous Report", with: @incident.anonymous_report
    fill_in "Attachment", with: @incident.attachment
    fill_in "Incident Description", with: @incident.incident_description
    fill_in "Incident Location", with: @incident.incident_location
    fill_in "Incident Location Details", with: @incident.incident_location_details
    fill_in "Incident Type", with: @incident.incident_type
    fill_in "Observed At", with: @incident.observed_at
    fill_in "Other Observers", with: @incident.other_observers
    fill_in "People Involved", with: @incident.people_involved
    fill_in "Role", with: @incident.role
    fill_in "User Id", with: @incident.user_id_id
    click_on "Create Incident"

    assert_text "Incident was successfully created"
    click_on "Back"
  end

  test "updating a Incident" do
    visit incidents_url
    click_on "Edit", match: :first

    fill_in "Anonymous Report", with: @incident.anonymous_report
    fill_in "Attachment", with: @incident.attachment
    fill_in "Incident Description", with: @incident.incident_description
    fill_in "Incident Location", with: @incident.incident_location
    fill_in "Incident Location Details", with: @incident.incident_location_details
    fill_in "Incident Type", with: @incident.incident_type
    fill_in "Observed At", with: @incident.observed_at
    fill_in "Other Observers", with: @incident.other_observers
    fill_in "People Involved", with: @incident.people_involved
    fill_in "Role", with: @incident.role
    fill_in "User Id", with: @incident.user_id_id
    click_on "Update Incident"

    assert_text "Incident was successfully updated"
    click_on "Back"
  end

  test "destroying a Incident" do
    visit incidents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Incident was successfully destroyed"
  end
end
