class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :description
      t.string :qr_code
      t.references :institution, null: false, foreign_key: true

      t.timestamps
    end
  end
end
