class BookingService < ApplicationRecord
  belongs_to :service
  belongs_to :booking
  belongs_to :billing, optional: true

  validates :service_id, presence: true
  validates :booking_id, presence: true
end
