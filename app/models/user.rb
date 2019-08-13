class User < ApplicationRecord
	has_many :attendances
	has_many :users, through: :attendances
end
