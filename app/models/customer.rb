class Customer < ApplicationRecord
  belongs_to :author
  has_many :bookings
end
