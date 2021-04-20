class CreateIncidents < ActiveRecord::Migration[6.1]
  def change
    create_table :incidents do |t|
      t.date :date_incident
      t.references :user, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
