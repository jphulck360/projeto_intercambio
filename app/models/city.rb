class City < ApplicationRecord
	belongs_to :country

	has_many :city_universities
	has_many :universities, :through => :city_universities
end
