class Service < ApplicationRecord
  belongs_to :author, class_name: 'User', primary_key: :id, foreign_key: :author_id
  has_many :booking_services, dependent: :destroy
  has_many :bookings, through: :booking_services
  has_many :billings, through: :booking_services

  validates :name, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :author_id, presence: true

  enum status: [ :disabled, :enabled ]

  scope :actives, -> { where(status: 'enabled') }
end
