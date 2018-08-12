class AttachmentsController < ApplicationController
  before_action :set_incident

  # def create
  #   add_more_attachments(attachments_params[:attachments])
  #   flash[:error] = "Failed uploading attachments" unless @incident.save
  #   redirect_back fallback_location: root_path
  # end

  def destroy
    remove_attachment_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting attachment" unless @incident.save
    redirect_back fallback_location: root_path
  end

  private

  def set_incident
    @incident = Incident.find(params[:incident_id])
  end

  # def add_more_attachments(new_attachments)
  #   attachments = @incident.attachments 
  #   attachments += new_attachments
  #   @incident.attachments = attachments
  # end

  def remove_attachment_at_index(index)
    remain_attachments = @incident.attachments # copy the array
    deleted_attachment = remain_attachments.delete_at(index) # delete the target attachment
    deleted_attachment.try(:remove!) # delete attachment from S3
    @incident.attachments = remain_attachments # re-assign back
  end

  def attachments_params
    params.require(:incident).permit({attachments: []}) # allow nested params as array
  end
end