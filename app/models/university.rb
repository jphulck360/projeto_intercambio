class University < ApplicationRecord
	belongs_to :cost
	belongs_to :country

	has_many :city_universities
	has_many :cities, :through => :city_universities

	has_many :course_universities
	has_many :courses, :through => :course_universities

	has_many :period_universities
	has_many :periods, :through => :period_universities
end
