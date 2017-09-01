class CreateCountryClimates < ActiveRecord::Migration[5.0]
  def change
    create_table :country_climates do |t|
    	t.references :country, foreign_key: true
    	t.references :climate, foreign_key: true
      t.timestamps
    end
  end
end
