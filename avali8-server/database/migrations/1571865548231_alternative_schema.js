'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class AlternativeSchema extends Schema {
  up () {
    this.create('alternatives', (table) => {
      
      table.increments()
      
      table.integer('question_id')
        .unsigned()
        .references('id')
        .inTable('questions')
        .onUpdate('CASCADE')
        .onDelete('CASCADE')

      table.string('a',500)
      table.string('b',500)
      table.string('c',500)
      table.string('d',500)
      table.enu('right_alternative',['a','b','c','d']).notNullable()
      table.timestamps()
      
    })
  }

  down () {
    this.drop('alternatives')
  }
}

module.exports = AlternativeSchema
