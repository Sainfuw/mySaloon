class Customer < ApplicationRecord
  belongs_to :author
  has_many :bookings

  enum status: { disable: 0, enable: 1 }
end
