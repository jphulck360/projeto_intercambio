class CreateCityUniversities < ActiveRecord::Migration[5.0]
  def change
    create_table :city_universities do |t|
    	t.references :city, foreign_key: true
    	t.references :university, foreign_key: true
      t.timestamps
    end
  end
end
