class Schedule < ApplicationRecord
	belongs_to :user
	belongs_to :student
	belongs_to :course
	belongs_to :country
	belongs_to :continent
	belongs_to :university
end
