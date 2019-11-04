'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class UserSchema extends Schema {
  up () {
    this.create('users', (table) => {
      table.increments()
      table.string('name', 80).notNullable()
      table.string('username', 80).notNullable().unique()
      table.integer('progress').defaultTo(0).unsigned()
      table.integer('level').defaultTo(1).unsigned()
      table.string('profile_image',255)
      table.string('email', 254).notNullable().unique()
      table.string('password', 80).notNullable()
      table.string('bio',1000)
      table.timestamps()
    })
  }

  down () {
    this.drop('users')
  }
}

module.exports = UserSchema
