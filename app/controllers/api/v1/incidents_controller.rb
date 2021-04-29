class API::V1::IncidentsController < API::V1::ApplicationAPIController
  load_and_authorize_resource
  before_action :set_incident, only: %i[ show edit update destroy ]

  # GET /incidents or /incidents.json
  def index
    @incidents = Incident.all
  end

  # GET /incidents/1 or /incidents/1.json
  def show
  end


  # POST /incidents or /incidents.json
  def create
    @incident = Incident.new(incident_params)
    set_aditional_data
      if @incident.save
        alert_mail
        render json: @incident, status: 201
      else
       render json: @incident.errors, status: 401
      end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident
      @incident = Incident.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def incident_params
      params.require(:incident).permit(:date_incident, :user_id, 
        :user_history_attributes => [:date, :user_history_details_attributes => [:symptom_id]],
        :test_covid_attributes => [:date_did, :date_get_result, :had_symptoms, :type_test, :result])
    end

    def set_aditional_data
      @incident.user_id = current_user.id
      @incident.date_incident = Time.now
    end

    def alert_mail
      to = PlaceHistory.possible_infections(@incident.user_id).pluck("email")
      NotificationMailer.alert_test(to)
    end

end
