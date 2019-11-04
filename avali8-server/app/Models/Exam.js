'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Exam extends Model {

    questions(){
        return this.hasMany('App/Models/Question','id','exam_id')
    }

    makeExams() {
        return this.belongsToMany('App/Models/User','exam_id','user_id','id','id').pivotTable('user_make_exam').withTimestamps()
    }

    users() {
        return this.belongsTo('App/Models/User')
    }

    badges() {
        return this.hasOne('App/Models/Badge')
    }
}

module.exports = Exam
