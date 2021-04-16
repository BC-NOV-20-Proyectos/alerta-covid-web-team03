class AddIncidentToTestCovid < ActiveRecord::Migration[6.1]
  def change
    add_reference :test_covids, :incident, null: false, foreign_key: true
  end
end
