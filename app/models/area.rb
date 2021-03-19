class Area < ApplicationRecord
  belongs_to :institution

  def self.search(text)
    if text.blank?  # blank? covers both nil and empty string
      all
    else
      where('description LIKE ?', "%#{text}%")
    end
  end
end
