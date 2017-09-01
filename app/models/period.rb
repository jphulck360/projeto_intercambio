class Period < ApplicationRecord
	has_many :period_universities
	has_many :universities, :through => :period_universities
end
