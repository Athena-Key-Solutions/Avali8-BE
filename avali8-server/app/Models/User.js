'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

/** @type {import('@adonisjs/framework/src/Hash')} */
const Hash = use('Hash')

class User extends Model {
  static boot () {
    super.boot()

    /**
     * A hook to hash the user password before saving
     * it to the database.
     */
    this.addHook('beforeSave', async (userInstance) => {
      if (userInstance.dirty.password) {
        userInstance.password = await Hash.make(userInstance.password)
      }
    })

  }

  tokens () {
    return this.hasMany('App/Models/Token','id','user_id')
  }

  questions () {
    return this.hasMany('App/Models/Question','id','user_id')
  }

  exams() {
    return this.hasMany('App/Models/Exam')
  }

  badges(){
    return this.hasMany('App/Models/Badge')
  }

  userHasBadge(){
    return this.belongsToMany('App/Models/Badge','user_id','badge_id','id','id').pivotTable('user_has_badge').withTimestamps()
  }

  makeExams() {
    return this.belongsToMany('App/Models/Exam','user_id','exam_id','id','id').pivotTable('user_make_exam').withTimestamps()
  }

  static get traits () {
    return [
      '@provider:Adonis/Acl/HasRole',
      '@provider:Adonis/Acl/HasPermission'
    ]
  }

  static get hidden () {
    return ['password']
  }

}

module.exports = User
