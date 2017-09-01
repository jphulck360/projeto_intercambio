class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :nome, default: ""
      t.string :cpf, default: ""
      t.string :telefone, default: ""
      t.string :univ_origem, default: ""
      t.string :cidade, default: ""
      t.string :pais, default: ""
      t.string :endereco, default: ""
      #t.references :mark, foreign_key: true
      t.references :course, foreign_key: false
      t.references :university, foreign_key: false
      t.timestamps
    end
  end
end
