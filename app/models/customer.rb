class Customer < ApplicationRecord
  belongs_to :author, class_name: 'User', primary_key: :id, foreign_key: :author_id
  has_many :bookings, dependent: :destroy
  has_many :billings, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :status, presence: true
  validates :author_id, presence: true

  enum status: [ :disabled, :enabled ]

  #before_save :coordinates

  def self.name_id
    Customer.pluck(:name, :id)
  end

  def coordinates
    @coords = Geocoder.search(self.address).first.coordinates
    self.latitude = @coords[0].round(7)
    self.longitude = @coords[1].round(7)
  end
end
