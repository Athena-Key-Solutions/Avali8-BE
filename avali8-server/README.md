# Avali8 API application

This is an api created to the application avali8.

Using MySQL

## Setup

First of all, make sure you have created a database with the name in your .env file, second edit the .env file to the configurations of your environment. (Like DB_DATABASE, DB_PASSWORD=123456)

### Migrations

Run the following command to run startup migrations (All database modified files).

```js
adonis migration:run
```

### Get Up the Server

```js
adonis serve --dev
```


##### API

Register

```
POST /avali8/api/v1/signup
{ "name" : "name", "username" : "username", "email" : "mail@mail.com", "password" : "password" }
```

Sign-In

```
POST /avali8/api/v1/login
{ "email": "mail@mail.com", "password" : "password" }
```

