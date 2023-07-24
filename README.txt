1 - Primeiro passo deve-se criar um banco de dados Postgree com o nome "areco"
2 - Segundo passo deve-se criar a tabela "produto"

Segue os scripts

CREATE DATABASE areco ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';

CREATE TABLE produto(
	id serial not null,
	descricao varchar(100) not null,
	data_cadastro timestamp not null,
	valor_unitario money not null,
	observacao varchar(300),
	constraint pk_produto primary key (id)
);

3 - Usuário e Senha do Banco de Dados deve ser postgres/123456, porta 5432 como mostra no arquivo uT_Conexao do projeto API
4 - Após configurar o Banco de Dados, deve-se compilar o projeto API que é uma API REST feita em Delphi com DataSnap, deixar a porta padrão 8080 e startar o servidor
5 - Com o Servidor REST Rodando, deve-se compilar o projeto TesteAreco e realizar as operações! 