class CreateIncidents < ActiveRecord::Migration[6.1]
  def change
    create_table :incidents do |t|
      t.date :from
      t.references :user_history, null: false, foreign_key: true
      t.references :test_covid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
