class CreateAreaHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :area_histories do |t|
      t.datetime :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
