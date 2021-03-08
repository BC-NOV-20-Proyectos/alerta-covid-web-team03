class UserHistoryDetail < ApplicationRecord
  belongs_to :user_history
  belongs_to :symtptom
end
