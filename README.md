# Cumbuca

## Requisitos

- elixir: 1.12
- postgres: 12

## Como rodar

Para rodar o projeto será necessário que o banco de dados Postgres esteja rodando.

Para instalar as dependências rode o comando:

```sh
mix deps.get
```


Para criar o banco de dados rode as migrations inserido o comando:

```sh
 mix ecto.setup
```

Para iniciar o servidor Phoenix rode o comando

```sh
 mix phx.server
```

## Usuário cadastrado

email: janedoe@gmail.com

password: 123456

## Endpoints disponíveis

## /api/users

Endpoint para criar um usuário.

Exemplo:

```sh
curl --request POST \
  --url http://localhost:4000/api/users \
  --header 'Content-Type: application/json' \
  --data '{
	"email": "John@gmail.com",
	"password": "123456"
}'
```

### /api/login

Endpoint para fazer login.

Exemplo:

```sh
curl --request POST \
  --url http://localhost:4000/api/login \
  --header 'Content-Type: application/json' \
  --data '{
	"email": "Joao@gmail.com",
	"password": "123456"
}'
```

## /api/accounts

Endpoint para criar uma conta.

Exemplos:

```sh
curl --request POST \
  --url http://localhost:4000/api/accounts \
  --header 'Content-Type: application/json' \
  --header 'authorization: Bearer <TOKEN AQUI>' \
  --data '{
	"name": "John",
	"lastname": "Doe",
	"cpf": "98798777656",
	"initial_balance": 250.00
}'
```

Endpoint para visualizar o saldo.

Exemplo:

```sh
curl --request GET \
  --url http://localhost:4000/api/accounts \
  --header 'Authorization: Bearer <TOKEN AQUI>'
```

## /api/transactions

Endpoint para cadastrar uma transação.

Exemplo:

```sh
curl --request POST \
  --url http://localhost:4000/api/transactions \
  --header 'Content-Type: application/json' \
  --header 'authorization: Bearer <TOKEN AQUI>' \
  --data '{
	"origin_account_id": "7fcdf8db-d94a-4cf2-833c-8797555dc517",
	"destination_account_id": "f6c3637f-b30a-41b3-b8bd-e36a427f3359",
	"amount": 50.00,
	"processing_date": "2022-04-20"
}
```

Endpoint para visualizar todas as transações de um usuário, entre uma data inicial e uma data final.

Exemplo

```sh
curl --request GET \
  --url 'http://localhost:4000/api/transactions?initial_date=2022-04-01&final_date=2022-04-20' \
  --header 'authorization: Bearer <TOKEN AQUI>'
```

