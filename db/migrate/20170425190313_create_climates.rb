class CreateClimates < ActiveRecord::Migration[5.0]
  def change
    create_table :climates do |t|
      t.string :nome, default: ""
      t.string :desc, default: ""

      t.timestamps
    end
  end
end
