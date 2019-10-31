'use strict'

/*
|--------------------------------------------------------------------------
| AlternativeSeeder
|--------------------------------------------------------------------------
|
| Make use of the Factory instance to seed database with dummy data or
| make use of Lucid models directly.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use('Factory')

class AlternativeSeeder {
  async run () {
    // await Factory.model('App/Models/Alternative').create()
  }
}

module.exports = AlternativeSeeder
