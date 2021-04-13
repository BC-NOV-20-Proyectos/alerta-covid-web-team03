#User model
class User < ApplicationRecord
  resourcify
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def generate_jwt
  	JWT.encode({ id: id,
                exp: 1.days.from_now.to_i },
               Rails.application.secrets.secret_key_base)
  end

  def self.search(text)
    if text.blank?  # blank? covers both nil and empty string
      all
    else
      where('name LIKE ? OR lasname LIKE ? OR email LIKE ?', "%#{text}%", "%#{text}%", "%#{text}%")
    end
  end
end
