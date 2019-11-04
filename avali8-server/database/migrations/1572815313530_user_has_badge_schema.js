'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class UserHasBadgeSchema extends Schema {
  up () {
    this.create('user_has_badge', (table) => {
      table.increments()
      
      table.integer('user_id')
      .unsigned()
      .references('id')
      .inTable('users')
      .onUpdate('CASCADE')
      .onDelete('CASCADE')
      .index('user_id')

      table.integer('badge_id')
      .unsigned()
      .references('id')
      .inTable('badges')
      .onUpdate('CASCADE')
      .onDelete('CASCADE')
      .index('badge_id')

      table.timestamps()
    })
  }

  down () {
    this.drop('user_has_badge')
  }
}

module.exports = UserHasBadgeSchema
