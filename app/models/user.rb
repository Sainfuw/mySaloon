class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :customers, class_name: "Customer", foreign_key: 'author_id', dependent: :destroy
  has_many :services, class_name: "Service", foreign_key: 'author_id', dependent: :destroy
  has_many :bookings, class_name: "Booking", foreign_key: 'author_id', dependent: :destroy
  has_many :billings, dependent: :destroy

  validates :name, presence: true
  validates :lastname, presence: true
  validates :status, presence: true
  validates :role, presence: true
  
  enum role: [ :professional, :assistant, :admin ]
  enum status: [ :disabled, :enabled ]

  def self.get_professionals
    User.where(role: "professional").pluck(:name, :id)
  end

end
