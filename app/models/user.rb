class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :customers
  has_many :services
  has_many :bookings

   enum role: { professional: 0, assistant: 1, admin: 2 }
   enum status: { disable: 0, enable: 1 }
end
