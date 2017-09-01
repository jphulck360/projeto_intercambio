class Course < ApplicationRecord
	has_many :course_universities
	has_many :universities, :through => :course_universities
end
