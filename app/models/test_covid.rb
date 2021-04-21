#Test covid model
class TestCovid < ApplicationRecord
  belongs_to :incident, optional: true
end
