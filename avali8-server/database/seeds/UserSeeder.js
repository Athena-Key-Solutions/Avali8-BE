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
const Factory = use('Factory')
const User = use('App/Models/User')
const Question = use('App/Models/Question')
const Alternative = use('App/Models/Alternative')


class UserSeeder {
  async run () {
    
    /*const roleAdmin = new Role()
    roleAdmin.name = 'Administrator'
    roleAdmin.slug = 'administrator'
    roleAdmin.description = 'Create content creators and manage exams'
    await roleAdmin.save()

    const roleContentCreator = new Role()
    roleContentCreator.name = 'Content Creator'
    roleContentCreator.slug = 'content-creator'
    roleContentCreator.description = 'Can create exams, questions'
    await roleContentCreator.save()*/

    // const user = await User.find(1)
    //const question = await Question.find(1)
    //const alternative = await Alternative.find(1)
    
    //console.log(await question.alternatives().fetch())

    const user = await User.find(1)
    await user.roles().attach([1])

    
    
    // await Factory.model('App/Models/User').create()
    // await Factory.model('App/Models/Alternative').create()
    // await Factory.model('App/Models/Question').create()

  }

}

module.exports = UserSeeder
