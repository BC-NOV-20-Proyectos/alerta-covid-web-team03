class AddIncidentToUserHistory < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_histories, :incident, null: false, foreign_key: true
  end
end
