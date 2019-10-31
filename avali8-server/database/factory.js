'use strict'

/*
|--------------------------------------------------------------------------
| Factory
|--------------------------------------------------------------------------
|
| Factories are used to define blueprints for database tables or Lucid
| models. Later you can use these blueprints to seed your database
| with dummy data.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */

const Factory = use('Factory')


Factory.blueprint('App/Models/User', (faker, index, data) => {
    const defaultValue = {
      username: faker.username(),
      email: faker.email(),
      password: 'secret',
      name: faker.name(),
    }
  
    return Object.assign(defaultValue, data)
})

Factory.blueprint('App/Models/Question', async (faker) => {
  return {
    description: faker.sentence(),
    area: faker.word(),
    difficulty: 'easy',
  }
})

Factory.blueprint('App/Models/Alternative', async (faker) => {
  return {
    a: faker.sentence(),
    b: faker.sentence(),
    c: faker.sentence(),
    d: faker.sentence(),
    right_alternative: 'a',
  }
})

/*

table.string('a',500).notNullable()
table.string('b',500).notNullable()
table.string('c',500).notNullable()
table.string('d',500).notNullable()
table.enu('right_alternative',['a','b','c','d']).notNullable()
table.timestamps()

*/