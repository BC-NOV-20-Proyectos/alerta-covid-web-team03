class CreateUserHistoryDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :user_history_details do |t|
      t.references :user_history, null: false, foreign_key: true
      t.references :symptom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
