class CourseUniversity < ApplicationRecord
	belongs_to :course
	belongs_to :university
end