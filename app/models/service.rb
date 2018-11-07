class Service < ApplicationRecord
  belongs_to :author, class_name: 'User', primary_key: :id, foreign_key: :author_id
  has_many :booking_services
  has_many :bookings, through: :booking_services
  has_many :billings, through: :booking_services

  enum status: [ :disabled, :enabled ]
end
