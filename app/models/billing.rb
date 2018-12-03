class Billing < ApplicationRecord
  belongs_to :customer
  has_many :booking_services, dependent: :destroy
  has_many :services, through: :booking_services
  has_many :bookings, through: :booking_services

  validates :payment_method, presence: true
  validates :amount, presence: true
  validates :customer_id, presence: true
end
