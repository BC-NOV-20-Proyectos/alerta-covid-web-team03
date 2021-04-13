class CreatePlaceHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :place_histories do |t|
      t.datetime :date
      t.references :user, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
