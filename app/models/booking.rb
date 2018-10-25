class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', primary_key: :id, foreign_key: :author_id
  belongs_to :customer
  has_many :booking_services
  has_many :services, through: :booking_services
  has_many :billings, through: :booking_services

  enum status: [ :nulled, :active, :completed ]
end
