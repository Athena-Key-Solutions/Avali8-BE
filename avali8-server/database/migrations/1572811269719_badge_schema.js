'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class BadgeSchema extends Schema {
  up () {
    this.create('badges', (table) => {
      table.increments()
      
      table.integer('user_id')
      .unsigned()
      .references('id')
      .inTable('users')
      .onUpdate('CASCADE')
      .onDelete('CASCADE')
      .index('user_id')

      table.integer('exam_id')
      .unsigned()
      .references('id')
      .inTable('exams')
      .onUpdate('CASCADE')
      .onDelete('CASCADE')
      .index('exam_id')
      

      table.string('name',150).notNullable()
      table.enu('score',[1,2,3]).notNullable()
      table.timestamps()
    })
  }

  down () {
    this.drop('badges')
  }
}

module.exports = BadgeSchema
