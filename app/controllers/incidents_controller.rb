class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :edit, :update, :destroy]

  # GET /incidents
  # GET /incidents.json
  def index
    @incidents = Incident.all
  end

  # GET /incidents/1
  # GET /incidents/1.json
  def show
  end

  # GET /incidents/new
  def new
    @incident = Incident.new
    @incident.user = User.new
  end

  # GET /incidents/1/edit
  def edit
  end

  # POST /incidents
  # POST /incidents.json
  def create
    @incident = Incident.new(incident_params)
    # Hard Coding is not a good practise but with db:seed we are generating anonymous user as first user
    # and querying db everytime won't be good idea. That will remain same always.
    # or we can initialize anonymous user id as constant to use application wide.
    @incident.user_id =  1  if incident_params[:submit_anonymously] == "1"

    respond_to do |format|
      if @incident.save
        puts "============redirecting as well"
        format.html { redirect_to @incident, notice: 'Thanks for submitting incident report.' }
        format.json { render :show, status: :created, location: @incident }
      else
        puts "===============render new"
        format.html { render :new }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  def update
    respond_to do |format|
      new_params = incident_params
      new_params[:attachments] = add_more_attachments(incident_params[:attachments]) if incident_params[:attachments]
      if @incident.update(new_params)
        format.html { redirect_to @incident, notice: 'Incident was successfully updated.' }
        format.json { render :show, status: :ok, location: @incident }
      else
        format.html { render :edit }
        format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incidents/1
  # DELETE /incidents/1.json
  def destroy
    @incident.destroy
    respond_to do |format|
      format.html { redirect_to incidents_url, notice: 'Incident was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      @incident = Incident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_params
      params.require(:incident).permit({:incident_types => []}, :submit_anonymously, :people_involved, :other_observers, :observed_at_string, :incident_location, :incident_location_details, :incident_description, {attachments: []}, user_attributes: [:name, :email, :phone, :role])
    end

    def add_more_attachments(new_attachments)
      attachments = @incident.attachments 
      attachments += new_attachments
    end
end
