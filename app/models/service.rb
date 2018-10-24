class Service < ApplicationRecord
  belongs_to :author
  has_many :booking_services
  has_many :bookings, through: :booking_services
  has_many :billings, through: :booking_services

  enum status: { disable: 0, enable: 1 }
end
