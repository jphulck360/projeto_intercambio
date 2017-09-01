class Country < ApplicationRecord
	has_many :country_climates
	has_many :climates, :through => :country_climates

	has_many :country_continents
	has_many :continents, :through => :country_continents

	has_many :country_languages
	has_many :languages, :through => :country_languages
end
