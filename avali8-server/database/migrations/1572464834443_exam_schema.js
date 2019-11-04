'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class ExamSchema extends Schema {
  up () {
    this.create('exams', (table) => {
      
      table.increments()
      table.integer('user_id')
      .unsigned()
      .references('id')
      .inTable('users')
      .onUpdate('CASCADE')
      .onDelete('CASCADE')
      .index('user_id')
      table.string('name',500).notNullable()
      table.string('area',100).notNullable()
      table.enu('difficulty',['easy','medium','hard'])
      table.timestamps()
      
    })
  }

  down () {
    this.drop('exams')
  }
}

module.exports = ExamSchema
