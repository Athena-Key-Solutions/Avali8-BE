'use strict'

/*
|--------------------------------------------------------------------------
| UserSeeder
|--------------------------------------------------------------------------
|
| Make use of the Factory instance to seed database with dummy data or
| make use of Lucid models directly.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Role = use('Role')


class UserSeeder {
  async run () {
    
    const roleAdmin = new Role()
    roleAdmin.name = 'Administrator'
    roleAdmin.slug = 'administrator'
    roleAdmin.description = 'Create content creators and manage exams'
    await roleAdmin.save()

    const roleContentCreator = new Role()
    roleContentCreator.name = 'Content Creator'
    roleContentCreator.slug = 'content-creator'
    roleContentCreator.description = 'Can create exams, questions'
    await roleContentCreator.save()

  }

}

module.exports = UserSeeder
