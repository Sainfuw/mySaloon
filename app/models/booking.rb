class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', primary_key: :id, foreign_key: :author_id
  belongs_to :customer
  has_many :booking_services, dependent: :destroy
  has_many :services, through: :booking_services
  has_many :billings, through: :booking_services

  validates :title, presence: true
  validates :date, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :user_id, presence: true
  validates :author_id, presence: true
  validates :customer_id, presence: true

  enum status: [ :nulled, :active, :completed ]

  before_save :set_date

  def color
    if self.active?
      return "#3AC4FE"
    elsif self.completed?
      return "#9F78FF"
    else
      return "#C3C3C3"
    end
  end

  def set_date
    self.start = self.date.to_date.to_s + " " + self.start.to_s(:time)
    self.end = self.date.to_date.to_s + " " + self.end.to_s(:time)
  end
end
