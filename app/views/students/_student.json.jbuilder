json.extract! student, :id, :nome, :cpf, :telefone, :univ_origem, :cidade, :pais, :endereco, :created_at, :updated_at
json.url student_url(student, format: :json)
