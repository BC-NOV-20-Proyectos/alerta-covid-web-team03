class PlaceHistory < ApplicationRecord
  belongs_to :user
  belongs_to :place
  @from = 7.days.ago.beginning_of_day.strftime('%F')
  @to = Date.today.strftime('%F')

  def self.possible_infections(user_id)
    query = <<-SQL 
    SELECT u.id, u.name, u.lasname, u.email, pl.description
    from place_histories ph
    left join users u on ph.user_id = u.id
    left join places pl on ph.place_id = pl.id
    where ph.date between \'#{@from}\' and  \'#{@to}\'
    and ph.place_id in  (select place_id 
     from place_histories phi 
     where phi.user_id = #{user_id }
     and ph.date between \'#{@from}\' and  \'#{@to}\')
    SQL
    result = ActiveRecord::Base.connection.execute(query)
  end


end
