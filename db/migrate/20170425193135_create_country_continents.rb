class CreateCountryContinents < ActiveRecord::Migration[5.0]
  def change
    create_table :country_continents do |t|
    	t.references :country, foreign_key: true
    	t.references :continent, foreign_key: true
      t.timestamps
    end
  end
end
