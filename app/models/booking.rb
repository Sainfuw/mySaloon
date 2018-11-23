class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', primary_key: :id, foreign_key: :author_id
  belongs_to :customer
  has_many :booking_services
  has_many :services, through: :booking_services
  has_many :billings, through: :booking_services

  enum status: [ :nulled, :active, :completed ]

  def color
    if self.active?
      return "#3AC4FE"
    elsif self.completed?
      return "#9F78FF"
    else
      return "#C3C3C3"
    end
  end
end
