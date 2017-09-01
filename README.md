# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



=================== DOCUMENTAÇÃO INTERSOFT ==================================

O intersoft é um sistema criado para selecionar um local que mais se adeque as necessidades do aluno.

Ao abordar intercâmbio, uma série de dúvidas vem no pensamento. Moradia, custo, ambiente, clima, lugar, tempo, entre outros 
fatores.

De um lado temos uma empresa de intercâmbio. Do outro, temos o aluno que possui o desejo de realizar um intercãmbio.
A empresa deseja oferecer o melhor lugar para o aluno estudar e se instalar. Muitas vezes o aluno não sabe a forma de realizar um intercâmbio, 
nem mesmo quanto gastar, se pode trabalhar.
Um exemplo que podemos ressaltar: Muitos querem ir para os EUA estudar nas melhores universidades, mas não gostam de frio.
Esse motivo pode variar desde gosto até por problemas de saúde.
O sistema deve procurar o lugar com o clima mais adequado ao estudante para que ele possa se sentir bem e seguro.

O Intersoft possui a tarefa de facilitar tanto o lado do agente como do aluno.

=========================================================================================================

Tabelas

- USUÁRIO => (USER)
- ALUNO => (STUDENT)
- CUSTO => (COST)
- CURSO => (COURSE)
- UNIVERSIDADE => (UNIVERSITY)
- CIDADE => (CITY)
- PAÍS => (COUNTRY)
- CONTINENTE => (CONTINENT)
- CLIMA => (CLIMATE)
- LINGUAS => (LANGUAGE)
- PERÍODO => (PERIOD)
- AGENDAMENTO => (SCHEDULE)

- UNI_CURSO (CURSO,UNIVERSIDADE) => (COURSE_UNIVERSITY)
- PAIS_CLIMA (PAÍS,CLIMA) => (COUNTRY_CLIMATE)
- CIDADE_UNIVERSIDADE (CIDADE,UNIVERSIDADE) => (CITY_UNIVERSITY)
- PAÍS_CONTINENTE (PAÍS,CONTINENTE) => (COUNTRY_CONTINENT)
- PAÍS_LINGUA (PAÍS,LINGUA) => (COUNTRY_LANGUAGE)
- UNI_PERIODO (UNIVERSIDADE,PERÍODO) => (PERIOD_UNIVERSITY)

=========================================================================================================

QUERIES DE TESTE

1) Listar países e continentes:

select c.nome,ctn.nome from country_continents cc 
inner join countries c on cc.country_id = c.id 
inner join continents ctn on cc.continent_id = ctn.id;



2) Listar universidades e períodos:

select up.id,p.duracao,u.nome from period_universities up
inner join periods p on up.period_id = p.id 
inner join universities u on up.university_id = u.id order by up.id;



3) Listar universidades e cursos:

select uc.id,c.nome,u.nome from course_universities uc
inner join courses c on uc.course_id = c.id 
inner join universities u on uc.university_id = u.id 
order by uc.id;



4) Listar cursos de acordo com as opções escolhidas:

- Busca Normal 

select u.nome,c.nome,p.nome,u.valor,ct.custo from course_universities uc
inner join universities u on uc.university_id = u.id
inner join courses c on uc.course_id = c.id
inner join costs ct on u.cost_id = ct.id
inner join countries p on u.country_id = p.id
where uc.course_id = #{@buscar};

- Busca Personalizada


=========================================================================================================

REGRAS

- Um USUÁRIO possui endereço,telefone,cargo
- Um ALUNO possui cpf,telefone,cidade,país,endereço,univ_origem,univ_dest
- O CUSTO possui nome
- Uma UNIVERSIDADE possui país,cursos,valor
- Uma CIDADE possui universidades
- Um PAÍS possui clima,continente
- Um CONTINENTE possui nome
- Um CLIMA possui nome
- Uma LÍNGUA possui nome

- O sistema pode possuir vários usuários; (1:N)

[ALUNO] (0,N) - (0,1) [CURSO]
- Um aluno pode cadastrar um curso. Um curso pode possuir vários alunos; (0:N)

[CURSO] (0,N) - (0,N) [UNIVERSIDADE]
- Um curso pode ser oferecido em várias universidades. Uma universidade pode ter vários cursos;

[CIDADE] (0,N) - (1,1) [PAÍS]
- Uma cidade pertence a um país. Um país contem várias cidades;

[CIDADE] (1,N) - (0,N) [UNIVERSIDADE]
- Uma cidade pode possuir várias universidades. Uma universidade pertence a uma ou várias cidades;

[PAÍS] (0,N) - (1,N) [CONTINENTE]
- Um país pertence a um ou vários continentes. Um continente possui vários países;

[PAÍS] (0,N) - (1,N) [CLIMA]
- Um país pertence a um ou vários continentes. Um continente possui vários países;
=========================================================================================================

Gerando scaffolds da aplicação

- USER (Gerar no DEVISE)
rails g scaffold user nome:string endereco:string telefone:string cargo:string

- STUDENT
rails g scaffold student nome:string cpf:string telefone:string univ_origem:string cidade:string pais:string endereco:string

- COST
rails g scaffold cost custo:string

- COURSE
rails g scaffold course nome:string

- UNIVERSITY
rails g scaffold university nome:string valor:integer

- CITY
rails g scaffold city nome:string 

- COUNTRY
rails g scaffold country nome:string 

- CONTINENT
rails g scaffold continent nome:string 

- CLIMATE
rails g scaffold climate nome:string 

- LANGUAGE
rails g scaffold language nome:string 

- COURSE_UNIVERSITY
rails g scaffold course_university 

- COUNTRY_CLIMATE
rails g scaffold country_climate 

- CITY_UNIVERSITY
rails g scaffold city_university 

- COUNTRY_CONTINENT
rails g scaffold country_continent 

- COUNTRY_LANGUAGE
rails g scaffold country_language 

=========================================================================================================

# Deletar scaffold model

- rails destroy scaffold user


# Criar controller

- rails generate controller Greetings hello

=========================================================================================================

Gerar Bootstrap

- https://github.com/seyhunak/twitter-bootstrap-rails
- https://alinecaton.wordpress.com/2013/02/25/criando-um-projeto-rails-usando-twitter-bootstrap/

rails generate bootstrap:install #less

=========================================================================================================

- Gerar DEVISE: https://github.com/plataformatec/devise


================== Critérios de Pesquisa ===================

O usuário pode pesquisar um lugar para realizar intercâmbio pelos seguintes critérios:

- continente
- país
- clima
- língua
- período
- custo