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
end
