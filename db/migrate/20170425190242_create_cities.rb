class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :nome, default: ""
      t.references :country, foreign_key: false
      t.timestamps
    end
  end
end
