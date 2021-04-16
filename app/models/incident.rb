class Incident < ApplicationRecord
  belongs_to :user_history
  belongs_to :test_covid
end
