class AddAreaAndInstitutionToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :area, null: false, foreign_key: true
    add_reference :users, :institution, null: false, foreign_key: true
  end
end
