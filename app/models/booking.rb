class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :author
  belongs_to :customer
  has_many :booking_services
  has_many :services, through: :booking_services
  has_many :billings, through: :booking_services

  enum role: { disable: 0, enable: 1 }
end
