'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class QuestionSchema extends Schema {
  up () {
    this.create('questions', (table) => {
      
      table.increments()
      
      table.integer('user_id')
        .unsigned()
        .references('id')
        .inTable('users')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')
        .index('user_id')

      table.string('description', 500).notNullable().unique()
      table.string('area', 100).notNullable()
      // table.integer('created_by').unsigned()

      // table
      //   .integer('user_id')
      //   .unsigned()
      //   .index('user_id')
      
      // table
      //   .foreign('user_id')
      //   .references('id')
      //   .inTable('question_user')
      //   .onDelete('CASCADE')

      table.enu('difficulty',['easy','medium','hard'])
      table.timestamps()

    })
  }

  down () {
    this.drop('questions')
  }
}

module.exports = QuestionSchema
