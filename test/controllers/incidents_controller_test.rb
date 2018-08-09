require 'test_helper'

class IncidentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @incident = incidents(:one)
  end

  test "should get index" do
    get incidents_url
    assert_response :success
  end

  test "should get new" do
    get new_incident_url
    assert_response :success
  end

  test "should create incident" do
    assert_difference('Incident.count') do
      post incidents_url, params: { incident: { anonymous_report: @incident.anonymous_report, attachment: @incident.attachment, incident_description: @incident.incident_description, incident_location: @incident.incident_location, incident_location_details: @incident.incident_location_details, incident_type: @incident.incident_type, observed_at: @incident.observed_at, other_observers: @incident.other_observers, people_involved: @incident.people_involved, role: @incident.role, user_id_id: @incident.user_id_id } }
    end

    assert_redirected_to incident_url(Incident.last)
  end

  test "should show incident" do
    get incident_url(@incident)
    assert_response :success
  end

  test "should get edit" do
    get edit_incident_url(@incident)
    assert_response :success
  end

  test "should update incident" do
    patch incident_url(@incident), params: { incident: { anonymous_report: @incident.anonymous_report, attachment: @incident.attachment, incident_description: @incident.incident_description, incident_location: @incident.incident_location, incident_location_details: @incident.incident_location_details, incident_type: @incident.incident_type, observed_at: @incident.observed_at, other_observers: @incident.other_observers, people_involved: @incident.people_involved, role: @incident.role, user_id_id: @incident.user_id_id } }
    assert_redirected_to incident_url(@incident)
  end

  test "should destroy incident" do
    assert_difference('Incident.count', -1) do
      delete incident_url(@incident)
    end

    assert_redirected_to incidents_url
  end
end
