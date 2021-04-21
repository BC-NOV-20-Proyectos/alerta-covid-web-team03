#Area model
class Area < ApplicationRecord
  belongs_to :institution

  def self.search(text)
    if text.blank?  # blank? covers both nil and empty string
      all
    else
      where('description LIKE ?', "%#{text}%")
    end
  end

  def self.area_report(from = 10.days.ago.beginning_of_day.strftime('%F'), to = Date.today.strftime('%F'))
    query = <<-SQL 
    select ins.description Institution, area.description Area,
    count(CASE WHEN tc.had_symptoms THEN 1 END) symptomatic, 
    count((CASE WHEN tc.result is true THEN 1 END)) positive_covid,  
    count((CASE WHEN tc.result is not true THEN 1 END)) negative_covid from users u 
    inner join incidents i on i.user_id = u.id 
    left join institutions ins on ins.id = u.institution_id
    left join areas area on area.id = u.area_id
    left join test_covids tc on i.id = tc.incident_id
    where i.date_incident between  \'#{from}\' and  \'#{to}\'
    group by ins.description, area.description
    SQL
    result = ActiveRecord::Base.connection.execute(query)
  end
  
end
