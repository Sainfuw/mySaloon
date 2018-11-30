class Customer < ApplicationRecord
  belongs_to :author, class_name: 'User', primary_key: :id, foreign_key: :author_id
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :status, presence: true
  validates :author_id, presence: true

  enum status: [ :disabled, :enabled ]

  def self.name_id
    Customer.pluck(:name, :id)
  end
end
