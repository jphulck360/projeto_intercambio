class Climate < ApplicationRecord
	has_many :country_climates
	has_many :countries, :through => :country_climates
end