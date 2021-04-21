#UserHistoryDetail model
class UserHistoryDetail < ApplicationRecord
  belongs_to :user_history, optional: true 
  has_one :symtptom
end
