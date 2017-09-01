class CountryClimate < ApplicationRecord
	belongs_to :country
	belongs_to :climate
end
