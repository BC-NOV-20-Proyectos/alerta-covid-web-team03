#UserHistory model
class UserHistory < ApplicationRecord
  belongs_to :incident, optional: true
  has_many :user_history_details 

  accepts_nested_attributes_for :user_history_details
end
