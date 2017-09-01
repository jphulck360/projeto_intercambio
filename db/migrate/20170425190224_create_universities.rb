class CreateUniversities < ActiveRecord::Migration[5.0]
  def change
    create_table :universities do |t|
      t.string :nome, default: ""
      t.float :valor, default: 0.0
      t.references :country, foreign_key: false
      t.references :cost, foreign_key: false
      t.timestamps
    end
  end
end
