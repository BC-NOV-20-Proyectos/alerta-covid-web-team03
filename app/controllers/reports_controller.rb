class ReportsController < ApplicationController
  before_action :get_date, only: %i[ search_user_reports search_area_reports ]

  def user_reports
    @result = Incident.people_report
  end

  def search_user_reports
    #NotificationMailer.welcome_to_covid_app.deliver_now
    @result = Incident.people_report(get_date[0], get_date[1])
    
  end



  private 
  def get_date
    params[:date].split(/ - /, 2)
  end
end
