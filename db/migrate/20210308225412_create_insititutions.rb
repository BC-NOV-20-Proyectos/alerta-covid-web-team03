class CreateInsititutions < ActiveRecord::Migration[6.1]
  def change
    create_table :institutions do |t|
      t.string :description

      t.timestamps
    end
  end
end
