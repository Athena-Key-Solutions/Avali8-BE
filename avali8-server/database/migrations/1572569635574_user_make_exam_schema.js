'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class UserMakeExamSchema extends Schema {
  up () {
    this.create('user_make_exam', (table) => {

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

      table.timestamps()
    })
  }

  down () {
    this.drop('user_make_exam')
  }
}

module.exports = UserMakeExamSchema
