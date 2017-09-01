class Continent < ApplicationRecord
	has_many :country_continents
	has_many :countries, :through => :country_continents
end
