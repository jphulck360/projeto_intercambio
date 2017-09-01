class CityUniversity < ApplicationRecord
	belongs_to :city
	belongs_to :university
end
