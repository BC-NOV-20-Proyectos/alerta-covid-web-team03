include Devise::JWT::RevocationStrategies::Denylist 
#User model
class User < ApplicationRecord
  resourcify
  rolify
  belongs_to :institution
  belongs_to :area
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  scope :Order_by_id, -> {order("id asc")}

  def self.search(text)
    if text.blank?  # blank? covers both nil and empty string
      all
    else
      where('name LIKE ? or lasname LIKE ? or email LIKE ?', "%#{text}%", "%#{text}%", "%#{text}%")
    end
  end

  def generate_jwt
  	JWT.encode({ id: id,
                exp: 1.days.from_now.to_i },
               Rails.application.secrets.secret_key_base)
  end


  def fullname
    "#{name}, #{lasname}"
  end
end
