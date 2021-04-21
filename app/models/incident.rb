class Incident < ApplicationRecord
  belongs_to :user
  has_one :user_history
  has_one :test_covid
  accepts_nested_attributes_for :test_covid, :user_history


  def self.people_report(from = 10.days.ago.beginning_of_day.strftime('%F'), to = Date.today.strftime('%F'))
    query = <<-SQL 
      select CONCAT(u.name, ' ', u.lasname) fullname,
      ins.description Institution, area.description Area,
      tc.had_symptoms, tc.result from users u 
      inner join incidents i on i.user_id = u.id
      left join institutions ins on ins.id = u.institution_id
      left join areas area on area.id = u.area_id
      left join test_covids tc on i.id = tc.incident_id
      where i.date_incident between  \'#{from}\' and  \'#{to}\'
    SQL
    result = ActiveRecord::Base.connection.execute(query)
  end

  private
  def date_now
    @now_date = Date.today.strftime('%F')
  end

  def date_from
   @from_date = 10.days.ago.beginning_of_day.strftime('%F')
  end
  
end
