class CountryContinent < ApplicationRecord
	belongs_to :country
	belongs_to :continent
end
