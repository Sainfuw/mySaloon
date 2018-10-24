class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :customers
  has_many :services
  has_many :bookings
  has_many :billings

   enum role: { admin: 0, assistant: 1, professional: 2 }
   enum status: { enable: 0, disable: 1 } 
end
