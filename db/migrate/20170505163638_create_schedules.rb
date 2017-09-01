class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.date :dt_saida, default: ""
      t.date :dt_retorno, default: ""
      t.integer :dias, default: 0
      t.float :preco, default: 0.0
      t.string :obs, default: ""
      t.references :user, foreign_key: true
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true
      t.references :country, foreign_key: true
      t.references :continent, foreign_key: true
      t.references :university, foreign_key: true
      t.timestamps
    end
  end
end
