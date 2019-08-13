class Event < ApplicationRecord
	include ActiveModel::Validations

	belongs_to :user
	validates :start_date, :duration, :location, presence: true
  validates :title, length: { in: 20..1000 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000  }
	validate :start_date_cannot_be_in_the_past, :duration_must_be_greater_than_0_and_multiple_by_5

	def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "La date ne peut pas être dans le passé.")
    end
  end

  def duration_must_be_greater_than_0_and_multiple_by_5
    if duration.present? && duration <= 0
      errors.add(:duration, "La durée doit être positive")
    end
    if duration.present? && (duration % 5) != 0
      errors.add(:duration, "La durée doit être un multiple de 5")
    end
  end

  has_many :attendances
  has_many :users, through: :attendances

end
