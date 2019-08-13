class Attendance < ApplicationRecord
	validates :stripe_customer_id, uniqueness: true

	belongs_to :user
	belongs_to :event

	after_create :attendance_confirmation_send
  def attendance_confirmation_send
    AttendanceMailer.attendance_confirmation_email(self).deliver_now
  end

end
