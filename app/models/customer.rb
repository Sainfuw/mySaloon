class Customer < ApplicationRecord
  belongs_to :author, class_name: 'User', primary_key: :id, foreign_key: :author_id
  has_many :bookings

  enum status: [ :disable, :enable ]
end
