class CreateTestCovids < ActiveRecord::Migration[6.1]
  def change
    create_table :test_covids do |t|
      t.date :date_did
      t.date :date_get_result
      t.boolean :had_symptoms
      t.string :type_test
      t.boolean :result

      t.timestamps
    end
  end
end
