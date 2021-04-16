class RemoveUserFromUserHistory < ActiveRecord::Migration[6.1]
  def change
    remove_reference :user_histories, :user, null: false, foreign_key: true
  end
end
